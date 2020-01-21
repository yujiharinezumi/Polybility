# README

# Polybility

# 概要
* 外国語を勉強している日本人と日本語を勉強している外国人を
* 共通の趣味などで繋げ、国際交流や語学学習を促進させるための言語交換アプリ

# バージョン情報
* Ruby 2.6.3
* Rails 5.2.4.1

# 機能一覧
- [ ] ユーザー登録機能
- [ ] ログイン機能
- [ ] 画像、文章の投稿機能
- [ ] お気に入り機能
- [ ] フォロー機能
- [ ] ラベリング機能
- [ ] 検索、絞り込み機能
- [ ] ページネーション機能

# カタログ設計
https://docs.google.com/spreadsheets/d/1HGmx7fWY8SfSPO0O3gJnoXRUiJE9wdVVGKEANiKlw8s/edit#gid=0
# テーブル設計
https://docs.google.com/spreadsheets/d/1HGmx7fWY8SfSPO0O3gJnoXRUiJE9wdVVGKEANiKlw8s/edit#gid=1191385107
# ER図
https://docs.google.com/spreadsheets/d/1HGmx7fWY8SfSPO0O3gJnoXRUiJE9wdVVGKEANiKlw8s/edit#gid=1367702877
![ER図](app/assets/images/table.png)
# 画面遷移図
https://docs.google.com/spreadsheets/d/1HGmx7fWY8SfSPO0O3gJnoXRUiJE9wdVVGKEANiKlw8s/edit#gid=1790406822
![画面遷移](app/assets/images/screen.png)
# ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1HGmx7fWY8SfSPO0O3gJnoXRUiJE9wdVVGKEANiKlw8s/edit#gid=2030893948
![画面遷移](app/assets/images/wire.png)

# 使用gem一覧

## フロント
* font-awesome-sass
* kaminari-bootstrap

## ログイン機能
* devise
* omniauth
* omniauth-facebook(できれば使いたい)
* omniauth-twitte(できれば使いたい)
* omniauth-google

## アドミン機能
* rails_admin
* cancancan

## 画像機能
* carrierwave
* mini_magick
* fog-aws(S3)

## ページネーション機能
* kaminari

## 検索機能
* ransack

## デバッグ
* pry-rails

## テスト
* rspec-rails
* spring-commands-rspec
* factory_bot_rails
* faker
* launchy
* capybara
* webdrivers
