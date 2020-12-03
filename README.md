# テーブル設計

## usersテーブル

| Column              | Type    | Option      |
| ------------------- |-------- |------------ |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| birthday            | date    | null: false |
| zenkaku_first_name  | string  | null: false |
| zenkaku_family_name | string  | null: false |
| kana_first_name     | string  | null: false |
| kana_family_name    | string  | null: false |


### Association
- has_many :items
- has_many :purchases



## itemsテーブル

| Column        | Type       | Option                         |
| ------------- |------------|------------------------------- | 
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| category      | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| shipping_fee  | string     | null: false                    |
| shipping_date | string     | null: false                    |
| deliver_from  | string     | null: false                    |

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



