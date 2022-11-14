# README

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
