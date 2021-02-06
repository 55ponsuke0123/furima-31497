# テーブル設計

##  users テーブル
| Column              | Type       | Options                    |
| ------------------- | ---------- | -------------------------- |
| nickname            | string     | null: false                |
| email               | string     | null: false, unique: true  |
| encrypted_password  | string     | null: false                |
| family_name_kanji   | string     | null: false                |
| first_name_kanji    | string     | null: false                |
| family_name_kana    | string     | null: false                |
| first_name_kana     | string     | null: false                |
| birthday_id         | integer    | null: false                |


### Association
has_one :user_details
has_many :items
has_many :purchased_items


##  user_details テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefectures        | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | integer    | null: false                    |


### Association
belongs_to :user


## items テーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |  
| image            | ActiveStrage | null: false                    |
| title            | string       | null: false                    |
| description      | text         | null: false                    |
| category_id      | integer      | null: false                    |
| state_id         | integer      | null: false                    |
| delivery_fee_id  | integer      | null: false                    |
| shipping_area_id | integer      | null: false                    |
| shipping_days_id | integer      | null: false                    |
| price            | integer      | null: false                    |

### Association
belongs_to :user
has_many :purchased_items

## purchased_items テーブル
| Column    | Type         | Options                        |
| --------- | ----------   | ------------------------------ |
| item      | references   | null: false, foreign_key: true |
| user      | references   | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
