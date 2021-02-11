class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, 
         presence: true
         validates :email, 
         uniqueness: true
         validates :encrypted_password,
         presence: true, length: { minimum: 6 }
         VALID_FAMILY_NAME_KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]/
         validates :family_name_kanji, 
         format: { with: VALID_FAMILY_NAME_KANJI_REGEX},
         presence: true 
         VALID_FIRST_NAME_KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]/
         validates :first_name_kanji, 
         format: { with: VALID_FIRST_NAME_KANJI_REGEX},
         presence: true 
         VALID_FAMILY_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
         validates :family_name_kana, 
         format: { with: VALID_FAMILY_NAME_KANA_REGEX},
         presence: true 
         VALID_FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
         validates :first_name_kana, 
         format: { with: VALID_FIRST_NAME_KANA_REGEX},
         presence: true 
         validates :birthday, presence: true

has_many :items
has_many :purchased_items
end
