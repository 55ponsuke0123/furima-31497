FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000aaa'}
    password_confirmation {password}
    family_name_kanji     {'煉獄'}
    first_name_kanji      {'杏寿郎'}
    family_name_kana      {'レンゴク'}
    first_name_kana       {'キョウジュロウ'}
    birthday              {'2020-01-01'}
  end
end