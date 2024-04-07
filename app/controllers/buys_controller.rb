class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_address = BuyAddress.new
    if user_signed_in? && @item.buy.nil?
      if current_user.id != @item.user_id
        @buy = @item.buy
        @user = current_user
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end


    def create
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @buy_address = BuyAddress.new(buy_params)
      if @buy_address.valid?
        pay_item
        @buy_address.save
        redirect_to root_path
      else
        render :index, status: :unprocessable_entity
    end
  end

    private

    def set_item
      @item = Item.find(params[:item_id])
    end

    def buy_params
      params.require(:buy_address).permit(:postal_code, :region_id, :city, :house_number, :building_number, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPの秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の価格
        card: params[:token], # 受け取ったPAY.JPのトークン
        currency: 'jpy'       # 通貨を日本円に設定
      )
    end
 end