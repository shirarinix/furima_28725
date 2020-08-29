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
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| sex_kana   | string | null: false |
| name_kana  | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| image          | string  | null: false                    |
| name           | string  | null: false                    |
| introduction   | text    | null: false                    |
| category_id    | integer | null: false                    |
| product_id     | integer | null: false                    |
| delivery_id    | integer | null: false                    |
| prefecture_id  | integer | null: false                    |
| preparation_id | integer | null: false                    |
| selling_price  | integer | null: false                    |
| user_id        | integer | null: false ,foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchas

## purchases テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| post_code     | string  | null: false                    |
| prefecture_id | integer | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  |                                |
| phone_number  | string  | null: false                    |
| purchas_id    | integer | null: false, foreign_key: true |

### Association

- belongs_to :purchas
