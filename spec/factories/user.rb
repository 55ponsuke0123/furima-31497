FactoryBot.define do
  factory :user do
    nickname              { 'test太郎' }
    email                 { 'test@test.com' }
    password              { '111bbb' }
    password_confirmation { password }
    family_name_kanji     { '坂田' }
    first_name_kanji      { '銀時' }
    family_name_kana      { 'サカタ' }
    first_name_kana       { 'ギントキ' }
    birthday              { '2020-04-30' }
  end
end
