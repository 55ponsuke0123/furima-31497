class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number 

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipalities, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

    extend ActiveHash::Associations::ActiveRecordExtensions
     belongs_to :prefecture

     validates :prefecture_id, numericality: { other_than: 0 }
end


      

      

