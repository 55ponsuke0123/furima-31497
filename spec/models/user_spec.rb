require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nickname,email,password,password_confirmation,family_name_kanji,first_name_kanji,family_name_kana,first_name_kana,birthdayが登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'family_name_kanjiが全角文字であれば登録できる' do
        @user.family_name_kanji = '煉獄'
        expect(@user).to be_valid
      end
      it 'first_name_kanjiが全角文字であれば登録できる' do
        @user.first_name_kanji = '杏寿郎'
        expect(@user).to be_valid
      end
      it 'family_name_kanaが全角カナであれば登録できる' do
        @user.family_name_kana = 'レンゴク'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カナであれば登録できる' do
        @user.first_name_kana = 'キョウジュロウ'
        expect(@user).to be_valid
      end
    end


    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailだと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含むものでないと登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数混合の5文字以下だと登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'paaawordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角では登録できない' do
        @user.password = '０００ａａａ'
        @user.password_confirmation = '０００ａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字が空だと登録できない' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
      end
      it '名前が空だと登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it '名字(カナ)が空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it '名前(カナ)が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名字が全角(漢字・平仮名・カタカナ)以外では登録できない' do
        @user.family_name_kanji = "kanji"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji is invalid")
      end
      it '名前が全角(漢字・平仮名・カタカナ)以外では登録できない' do
        @user.first_name_kanji = "kanji"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji is invalid")
      end
      it '名字のフリガナが全角カタカナ以外では登録できない' do
        @user.family_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it '名前のフリガナが全角カタカナ以外では登録できない' do
        @user.first_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '名字のフリガナが半角では登録できない' do
        @user.family_name_kana = "ｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it '名前のフリガナが半角では登録できない' do
        @user.first_name_kana = "ｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
end
