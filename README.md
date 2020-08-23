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

| Column        | Type    | Options                       |
| --------------| ------- | ----------------------------- |
| image         | string  | null: false                   |
| name          | string  | null: false                   |
| introduction  | text    | null: false                   |
| genre_id      | integer | null: false                   |
| selling_price | integer | null: false                   |
| user_id       | integer | null: false ,foreign_key: true|

### Association

- belongs_to :users
- has_one    :purchases

## purchases テーブル

| Column  | Type    | Options                       |
| ------- | ------- | ----------------------------- |
| user_id | integer | null: false, foreign_key: true|
| item_id | integer | null: false, foreign_key: true|

### Association

- belongs_to :users
- belongs_to :items
- has_one    :addresses

## addresses テーブル

| Column         | Type    | Options                       |
| -------------- | ------- | ----------------------------- |
| post_code      | string  | null: false                   |
| prefectures_id | string  | null: false                   |
| city           | string  | null: false                   |
| address        | string  | null: false                   |
| building_name  | string  | null: false                   |
| phone_number   | string  | null: false                   |
| item_id        | integer | null: false, foreign_key: true|

### Association

- belongs_to :purchases
