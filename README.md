# テーブル設計

## usersテーブル

| Column        | Type    | Option      |
| ------------- |-------- |------------ |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| zenkaku_name  | string  | null: false |
| kana_name     | string  | null: false |
| birth_year    | integer | null: false |
| birth_month   | integer | null: false |
| birth_date    | integer | null: false |

### Association
- has_many :items
- has_many :purchases



## itemsテーブル

| Column   | Type         | Option                         |
| -------- |--------------|------------------------------- | 
| name     | string       | null: false                    |
| text     | text         | null: false                    |
| category | string       | null: false                    |
| price    | integer      | null: false                    |
| user     | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase



## purchasesテーブル

| Column      | Type       | Option                         |
| ----------- |----------- | ------------------------------ | 
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| shipment    | references | null: false, foreign_key: true |
| credit_card | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :credit_card
- has_one :shipment


## shipmentsテーブル

| Column       | Type    | Option      |
| ------------ |-------- |------------ |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association
- belongs_to :purchase



## credit_cardsテーブル

| Column       | Type   | Option      |
| ------------ |------- | ----------- | 
| card_number  | string | null: false |
| expire_year  | string | null: false |
| expire_month | string | null: false |
| expire_date  | string | null: false |

### Association
- belongs_to :purchase
