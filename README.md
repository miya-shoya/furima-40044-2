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
| birthday                        | string | null: false |

#Association

include ActiveHash::Associations
- has_many :items

  has_many :buys

#itemsテーブル

| Column            | Type        | Options     |
| ------            | -----       | ----------- |
| name              | string      | null: false |
| info              | text        | null: false |
| category          | integer     | null: false |
| situation         | integer     | null: false |
| cost              | integer     | null: false |
| region            | integer     | null: false |
| days              | integer     | null: false |
| price             | string      | null: false |
| user              | references  | foreign_key: true |

#Association
   extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :users

  has_many buys


#buysテーブル

| Column   | Type       | Options      |
| ------   | ---------- | -------------|
| user     | references | null: false, |
| items    | references | null: false, |
| address  | string     | null: false  |
| users:id
| items:id

#Association

 belongs_to :items
t.references :users

#addressテーブル

| Column                           | Type   | Options     |
| number                           | string | null: false |
| metropolis                       | string | null: false |
| city                             | string | null: false |
| street_address                   | string | null: false |
| build                            | string | null: false |
| tel_number                       | string | null: false |
| buys:id