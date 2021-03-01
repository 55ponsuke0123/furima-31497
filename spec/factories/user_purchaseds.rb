FactoryBot.define do
  factory :user_purchased do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipalities { '東京都' }
    address { '目黒区' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
