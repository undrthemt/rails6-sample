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

## docker-composeでの起動方法
* .envファイルで自ホスト側のポートを変更できます

```bash
# 初回
cp -p .env.example .env
mkdir tmp/pids
docker-compose up
docker-compose exec app bundle exec rails db:create 

# 以降
docker-compose up
```


## 初期のアプリケーション生成時のコマンド
* rbenv, yarnが入っている前提

```bash
rbenv local 2.6.5
rbenv exec gem install bundler
rbenv rehash
bundle init
# Gemfile の gem 'rails'をコメントアウト
bundle install --path=vendor/bundle
bundle exec rails new . --skip-bundle
# Gemfile に gem 'pg' のみ追加
bundle install
bundle exec rails webpacker:install 
yarn install --check-files
```

