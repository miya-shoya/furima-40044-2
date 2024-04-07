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

#usersテーブル

| Column                          | Type   | Options     |
| ------------------              | ------ | ----------- |
| nickname                        | string | null: false |
| email                           | string | null: false, unique: true |
| encrypted_password              | string | null: false |
| lastname                        | string | null: false |
| firstname                       | string | null: false |
| lastname_kana                   | string | null: false |
| firstname_kana                  | string | null: false |
| birthday                        | date   | null: false |

#Association


- has_many :items

  has_many :buys

#itemsテーブル

| Column            | Type        | Options     |
| ------            | -----       | ----------- |
| name              | string      | null: false |
| info              | text        | null: false |
| category_id       | integer     | null: false |
| situation_id      | integer     | null: false |
| cost_id           | integer     | null: false |
| region_id         | integer     | null: false |
| delivery_day_id   | integer     | null: false |
| price             | integer     | null: false |
| user              | references  | foreign_key: true, null: false |

#Association
  
  belongs_to :user

  has_one :buy


#buysテーブル

| Column   | Type       | Options      |
| ------   | ---------- | -------------|
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

#Association

 belongs_to :item
 belongs_to :user
 has_one :address

#addressesテーブル

| Column                           | Type   | Options     |
| ------                           | -------| -------------|
| postal_code                      | string | null: false |
| region_id                        | integer | null: false |
| city                             | string | null: false |
| house_number                     | string | null: false |
| building_number                  | string |             |
| phone_number                     | string | null: false |
| buy                              | references  | foreign_key: true, null: false |

belongs_to :buy