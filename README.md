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

- has_many :items,foreign_key :"user_id"
- has_many :purchases,foreign_key :"user_id"

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| image         | string  | null: false |
| name          | string  | null: false |
| introduction  | text    | null: false |
| category      | string  | null: false |
| selling_price | integer | null: false |

### Association

- belongs_to :users
- has_one    :purchases,foreign_key :"item_id"

## purchases テーブル

| Column  | Type  | Options     |
| ------- | ----- | ----------- |
| user_id |string | null: false |
| item_id |string | null: false |

### Association

- has_one    :users
- has_one    :items
- belongs_to :adresses

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_code     | references | null: false |
| city          | string     | null: false |
| address       | references | null: false |
| building_name | references | null: false |
| phone_number  | references | null: false |

### Association

- has_one :purchases
