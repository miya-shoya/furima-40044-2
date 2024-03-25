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

#userテーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false, unique: true |
| password               | string | null: false |
| lastname               | string | null: false |
| firstname              | string | null: false |
| lastname(kana)         | string | null: false |
| firstname(kana)        | string | null: false |


#Association

- has_many :shohin

#shohinテーブル

| Column           | Type   | Options     |
| ------           | ------ | ----------- |
| name             | string | null: false |
| sethumei         | string | null: false |
| category         | string | null: false |
| jotai            | string | null: false |
| hutan            | string | null: false |
| region           | string | null: false |
| nissu            | string | null: false |
| price            | string | null: false |
| user             | string | null: false |

#Association

- belongs_to :user


#konyuテーブル

| Column   | Type       | Options      |
| ------   | ---------- | -------------|
| user     | references | null: false, |
| shohin   | references | null: false, |
| assress  | string     | null: false  |

#Association

t.references :user
t.references :shohin

