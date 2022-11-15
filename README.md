# README

## 環境

```
$ ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin20]
$ rails -v
Rails 5.2.8.1
$ postgres --version
postgres (PostgreSQL) 10.22
```

## セットアップ

```
$ bundle install
$ bin/rails db:create
$ bin/rails db:migrate
```

## 管理ユーザーの作成

```
$ bin/rails c
irb(main):001:0> User.create!(name: "admin", email: "admin@example.com", password: "password", password_confirmation: "password", admin: true)
```

## 実行

```
$ bin/rails s
```
