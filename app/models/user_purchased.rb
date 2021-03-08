class UserPurchased
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id, :token, :purchased_item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipalities, format: { with: /\A[ぁ-ゔァ-ヴー一-龥々]+\z/ }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
    validates :purchased_item_id
  end


     validates :prefecture_id, numericality: { other_than: 0 }

     def save
      purchased_item = PurchasedItem.create(user_id: user_id, item_id: item_id)
      UserDetail.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchased_item_id: purchased_item.id)
     end
end


      

      

