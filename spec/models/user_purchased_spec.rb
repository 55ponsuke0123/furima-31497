require 'rails_helper'

RSpec.describe UserPurchased, type: :model do
  describe '#create' do
    before do
      @user_purchased = FactoryBot.build(:user_purchased)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_purchased).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_purchased.postal_code = ''
      @user_purchased.valid?
      expect(@user_purchased.errors.full_messages).to include "Postal code can't be blank"
    end
    it 'postal_codeは半角のハイフンを含んだ形式でないと保存できないこと' do
      @user_purchased.postal_code = '1234567'
      @user_purchased.valid?
      expect(@user_purchased.errors.full_messages).to include "Postal code is invalid"
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @user_purchased.prefecture_id = 0
      @user_purchased.valid?
      expect(@user_purchased.errors.full_messages).to include "Prefecture must be other than 0"
    end
    it 'municipalitiesが空だと保存できないこと' do
      @user_purchased.municipalities = ''
      @user_purchased.valid?
      expect(@user_purchased.errors.full_messages).to include "Municipalities can't be blank"
    end
    it 'municipalitiesは全角日本語であること' do
      @user_purchased.municipalities = 'tokyoto'
      @user_purchased.valid?
      expect(@user_purchased.errors.full_messages).to include "Municipalities is invalid"
    end
    it 'addressが空だと保存できないこと' do
      @user_purchased.address = ''
      @user_purchased.valid?
      expect(@user_purchased.errors.full_messages).to include "Address can't be blank"
    end
    it 'building_nameは空でも保存できること' do
      @user_purchased.building_name = ''
      expect(@user_purchased).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_purchased.phone_number = ''
      @user_purchased.valid?
      expect(@user_purchased.errors.full_messages).to include "Phone number can't be blank"
    end
    it 'phone_numberは半角数字でないと保存できないこと' do
      @user_purchased.phone_number = '０９０１２３４５６７８'
      @user_purchased.valid?
      expect(@user_purchased.errors.full_messages).to include "Phone number is invalid"
    end
    it 'phone_numberは12桁以上では保存できないこと' do
      @user_purchased.phone_number = '090123456789'
      @user_purchased.valid?
      expect(@user_purchased.errors.full_messages).to include "Phone number is invalid"
    end
  end
end
