# テーブル設計

##  users テーブル
| Column     | Type       | Options       |
| ---------- | ---------- | ------------- |
| email      | string     | null: false   |
| password   | string     | null: false   |
| nickname   | string     | null: false   |


### Association
has_many :sold_item
has_many :for_sale_item
has_many :purchased_item
has_one :profile

##  profiles テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| shipping_address   | string     | null: false                    |
| credit_card_number | integer    | null: false                    |
| credit_card_limit  | integer    | null: false                    |
| security_cord      | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
belongs_to :user


## sold_items テーブル
| Column    | Type         | Options                        |
| --------- | ----------   | ------------------------------ |
| title     | string       | null: false                    |
| state     | text         | null: false                    |
| category  | text         | null: false                    |
| image     | ActiveStrage | null: false                    |
| price     | integer      | null: false                    |
| detail    | text         | null: false                    |
| user_id   | references   | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :state
has_one :category

## for_sale_items テーブル
| Column    | Type         | Options                        |
| --------- | ----------   | ------------------------------ |
| title     | string       | null: false                    |
| state     | text         | null: false                    |
| category  | text         | null: false                    |
| image     | ActiveStrage | null: false                    |
| price     | integer      | null: false                    |
| detail    | text         | null: false                    |
| user_id   | references   | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :state
has_one :category

## purchased_items テーブル

| Column    | Type         | Options                        |
| --------- | ----------   | ------------------------------ |
| title     | string       | null: false                    |
| state     | text         | null: false                    |
| category  | text         | null: false                    |
| image     | ActiveStrage | null: false                    |
| price     | integer      | null: false                    |
| detail    | text         | null: false                    |
| user_id   | references   | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :state
has_one :category

## states テーブル
| Column          | Type         | Options                          |
| --------------  | ----------   | ------------------------------   |
| sold_item       | references   | null: false, foreign_key: true   |
| for_sale_item   | references   | null: false, foreign_key: true   |
| purchased_item  | references   | null: false, foreign_key: true   |

### Association
belongs_to :sold_item
belongs_to :for_sale_item
belongs_to :purchased_item

## categories テーブル

| Column          | Type         | Options                          |
| --------------  | ----------   | ------------------------------   |
| sold_item       | references   | null: false, foreign_key: true   |
| for_sale_item   | references   | null: false, foreign_key: true   |
| purchased_item  | references   | null: false, foreign_key: true   |

### Association
belongs_to :sold_item
belongs_to :for_sale_item
belongs_to :purchased_item

