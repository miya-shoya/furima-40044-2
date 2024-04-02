class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]


  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def ensure_correct_user
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      flash[:notice] = "You do not have permission to edit this item."
      redirect_to root_path
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :info, :category_id, :situation_id, :cost_id, :region_id, :delivery_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
