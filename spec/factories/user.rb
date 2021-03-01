FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6 )
    password              { password }
    password_confirmation { password }
    family_name_kanji     { '松田' }
    first_name_kanji      { '聖子' }
    family_name_kana      { 'マツダ' }
    first_name_kana       { 'セイコ' }
    birthday              { '2020-04-30' }
  end
end
