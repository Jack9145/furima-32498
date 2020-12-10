# テーブル設計

## usersテーブル

| Column              | Type    | Option                        |
| ------------------- |-------- |------------------------------ |
| nickname            | string  | null: false                   |
| email               | string  | null: false, uniqueness: true |
| encrypted_password  | string  | null: false                   |
| birthday            | date    | null: false                   |
| zenkaku_first_name  | string  | null: false                   |
| zenkaku_family_name | string  | null: false                   |
| kana_first_name     | string  | null: false                   |
| kana_family_name    | string  | null: false                   |


### Association
- has_many :items
- has_many :purchases



## itemsテーブル

| Column           | Type       | Option                         |
| ---------------- |------------|------------------------------- | 
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| category_id      | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| status_id        | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase



## purchasesテーブル

| Column      | Type       | Option                         |
| ----------- |----------- | ------------------------------ | 
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment


## shipmentsテーブル

| Column        | Type        |    Option                      |
| ------------- |------------ |------------------------------- |
| postal_code   | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building      | string      |                                |
| phone_number  | string      | null: false                    |
| purchase      | references  | null: false, foreign_key: true |


### Association
- belongs_to :purchase



