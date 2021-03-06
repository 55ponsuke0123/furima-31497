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
| birthday            | date       | null: false                |

### Association
has_many :items
has_many :purchased_items


##  user_details テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| purchased_item_id  | references | null: false, foreign_key: true |


### Association
belongs_to :purchased_item


## items テーブル
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |  
| title            | string       | null: false                    |
| description      | text         | null: false                    |
| category_id      | integer      | null: false                    |
| state_id         | integer      | null: false                    |
| delivery_fee_id  | integer      | null: false                    |
| shipping_days_id | integer      | null: false                    |
| price            | integer      | null: false                    |
| user             | references   | null: false, foreign_key: true |


### Association
belongs_to :user
has_one :purchased_item


## purchased_items テーブル
| Column    | Type         | Options                        |
| --------- | ----------   | ------------------------------ |
| item_id   | references   | null: false, foreign_key: true |
| user_id   | references   | null: false, foreign_key: true |


### Association
belongs_to :user
has_one :user_detail
belongs_to :item
