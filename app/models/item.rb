class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchased_item

  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :price
  end          
end
