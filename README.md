# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| adress     | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_image      | references | null: false, foreign_key: true |
| item_name       | references | null: false, foreign_key: true |
| introduction    | text       | null: false                    |
| category        | string     | null: false                    |
| item_condition  | string     | null: false                    |
| Delivery_fee    | string     | null: false                    |
| Shipping_area   | string     | null: false                    |
| preparation_day | string     | null: false                    |
| Selling_price   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :purchases

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | references | null: false, foreign_key: true |
| expiration_year  | references | null: false, foreign_key: true |
| expiration_month | references | null: false, foreign_key: true |
| security_code    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :adresses

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address       | references | null: false, foreign_key: true |
| building_name | references | null: false, foreign_key: true |
| phone_number  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases
