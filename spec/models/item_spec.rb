require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
  before do
  @item = FactoryBot.build(:item)
  end

describe '商品出品機能' do
  context '商品出品がうまくいく時' do
    it 'image,title,description,category_id,state_id,delivery_fee_id,prefecture_id,shipping_days_id,priceがあれば出品できる' do
      expect(@item).to be_valid
    end
    it 'priceが300~9,999,999の間であれば出品できる' do
      @item.price = 3000
      expect(@item).to be_valid
    end
    it 'priceが半角数字であれば出品できる' do
      @item.price = 3000
      expect(@item).to be_valid
    end
  end

  context '商品出品がうまくいかない時' do
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'titleが空だと出品できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Title can't be blank"
    end
    it 'descriptionが空だと出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end
    it 'category_idが空だと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'category_idの番号が0だと出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 0"
    end
    it 'state_idが空だと出品できない' do
      @item.state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "State can't be blank"
    end
    it 'state_idの番号が0だと出品できない' do
      @item.state_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "State must be other than 0"
    end
    it 'delivery_fee_idが空だと出品できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
    end
    it 'delivery_fee_idの番号が0だと出品できない' do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery fee must be other than 0"
    end
    it 'prefecture_idが空だと出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it 'prefecture_idの番号が0だと出品できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
    end
    it 'shopping_days_idが空だと出品できない' do
      @item.shipping_days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping days can't be blank"
    end
    it 'shipping_days_idの番号が0だと出品できない' do
      @item.shipping_days_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping days must be other than 0"
    end
    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceが¥300以下だと出品できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it 'priceが¥10,000,000以上だと出品できない' do
      @item.price = 20000000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it 'priceが全角数字だと出品できない' do
      @item.price = '９０００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it 'priceが半角英数混合では出品できない' do
      @item.price = 'u1200'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it 'priceが半角英語だけでは出品できない' do
      @item.price = 'ejikhn'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it 'ユーザーが紐づいていないと商品は出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
   end
  end
 end
end
