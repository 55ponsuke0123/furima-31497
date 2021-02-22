class UserDetail < ApplicationRecord
  belongs_to :purchased_item


    extend ActiveHash::Associations::ActiveRecordExtensions
     belongs_to :prefecture

     validates :prefecture_id, numericality: { other_than: 0 }
end