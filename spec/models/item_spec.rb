require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name,image,price,user,info,category_id,situation_id,cost,_id,region_id,delivery_day_idが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空では保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'infoが空では保存できないこと' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが空では保存できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it 'situation_idが空では保存できないこと' do
        @item.situation_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation must be other than 0")
      end
      it 'cost_idが空では保存できないこと' do
        @item.cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be other than 0")
      end
      it 'region_idが空では保存できないこと' do
        @item.region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 0")
      end
      it 'delivery_day_idが空では保存できないこと' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 0")
      end
      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが10000000以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
    end
  end
end
