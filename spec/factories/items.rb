FactoryBot.define do
  factory :item do
    title            { 'レシピ本です' }
    description      { '天才料理人のレシピ本です' }
    category_id      { 4 }
    state_id         { 2 }
    delivery_fee_id  { 2 }
    prefecture_id    { 13 }
    shipping_days_id { 3 }
    price            { 1200 }
    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
