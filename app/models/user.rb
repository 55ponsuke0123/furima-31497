class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :birthday
          end
          VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze           
          validates :password,
                    presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
          VALID_NAME_KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]/
          with_options presence: true, format: { with: VALID_NAME_KANJI_REGEX } do
          validates :family_name_kanji
          validates :first_name_kanji         
          end
          VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
          with_options presence: true, format: { with: VALID_NAME_KANA_REGEX } do
          validates :family_name_kana
          validates :first_name_kana
          end 
               
          
          has_many :items
          has_many :purchased_items
        end