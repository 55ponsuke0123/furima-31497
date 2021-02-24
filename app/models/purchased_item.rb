class PurchasedItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :user_detail
end
