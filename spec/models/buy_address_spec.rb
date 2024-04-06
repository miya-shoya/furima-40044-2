require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '商品購入機能' do
    before do
      @buy_address = FactoryBot.build(:buy_address)
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
    end

    context '商品購入がうまくいくとき' do
      it 'user_idとitem_idが存在すれば登録できる' do
        expect(@buy_address).to be_valid
      end

      it 'postal_codeとregion_idとcityとhouse_numberとphone_number_とbuy_idが存在すれば登録できる' do
        expect(@buy_address).to be_valid
      end
      it 'postal_codeがハイフン含めた7桁の数字なら登録できる' do
        @buy_address.postal_code = '123-4567'
        expect(@buy_address).to be_valid
      end
      it 'phone_numberが11桁の数字なら登録できる' do
        @buy_address.phone_number = '12345678901'
        expect(@buy_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'user_idが空では保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空では保存できないこと' do
        @buy_address.postal_code = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'region_idが空では保存できないこと' do
        @buy_address.region_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @buy_address.city = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できないこと' do
        @buy_address.house_number = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @buy_address.phone_number = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では保存できないこと' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it "region_idの値が、id:1,name:'--'の時は保存できないこと" do
        @buy_address.region_id = [1]
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Region is not a number')
      end
      it 'postal_codeが6桁以下だと登録できないこと' do
        @buy_address.postal_code = '123456'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが8桁以上だと登録できないこと' do
        @buy_address.postal_code = '12345678'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeがハイフンがないと登録できないこと' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'phone_numberが10桁以下だとの数字なら登録できない' do
        @buy_address.phone_number = '1234567890'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上だとの数字なら登録できない' do
        @buy_address.phone_number = '123456789012'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end