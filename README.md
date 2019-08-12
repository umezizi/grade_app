# GradeShare

クライミングジムのレビューと、クライミングジムを中心に展開するクライマーの為のコミュニティサービスです。

URL:<https://www.grade-share.com/>

## デモアカウント

```md
email: test@gradeshare.com
password: password

```

## 搭載機能・技術一覧

- ユーザー管理機能
  - ユーザー登録・ログイン機能全般(devise)
  - パスワードを忘れた際の再設定メール(AWS SES, devise)
  - Twitterログイン(omniauth-twitter)
  - デモユーザー簡単ログイン機能
  - プロフィール画像アップロード
  - ユーザー一覧表示
- 管理ユーザー機能
  - 管理ユーザーのみジム・他ユーザーの削除が可能
- ジム投稿機能
  - ジム画像アップロード(AWS S3, Active Storage, mini_magick)
  - 住所から位置情報取得(geocoder, Geocoding API)
  - 地図表示(Google Maps API)
- レビュー投稿機能
  - ４つの指標に対する５段階評価
  - ジムの平均評価点算出
  - レビュー一覧表示
- ホームジム登録機能(ジムに対するフォロー機能)
  - 同じホームジムに所属するユーザーの投稿をタイムラインに表示
  - ホームジム一覧表示
  - ジムに所属するユーザーの一覧表示
- コメント機能
  - 自身と同じジムに所属するユーザーのタイムラインに表示
  - 自身のコメント一覧表示
- デザイン
  - レスポンシブ(Bootstrap4)
- 検索機能(Ransack)
- ページネーション機能(kaminari)
- テスト
  - RSpec
    - 単体テスト(model spec)
    - 統合テスト(feature spec)
  - factory_bot
- その他
  - bulletを用いた「N+1」問題の解消
  - Rubucopも用いたソースの改善・整形




## 環境


## AWS構成図


## CircleCI


 README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

test

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
