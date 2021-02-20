class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchased_item

  with_options presence: true do
    validates :title
    validates :description
    validates :image
  end

  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze    
  validates :price, presence: true, inclusion: { in: (300..9999999)}, format: { with: VALID_PRICE_REGEX }   

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_days

  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_days_id
  end
  
end
