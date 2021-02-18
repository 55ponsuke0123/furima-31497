class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchased_item

  with_options presence: true do
    validates :title
    validates :description
    validates :image
  end
  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_days_id
  end

  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze    
  validates :price, presence: true, inclusion: { in: (300..9999999)}, format: { with: VALID_PRICE_REGEX }   

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days
end
