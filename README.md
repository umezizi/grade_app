# GradeShare

クライミングジムを中心に展開するクライマーの為のコミュニティサービスです。
詳しくは本アプリの「ABOUT」ページをご覧ください。

URL:<https://www.grade-share.com/>

## デモアカウント

```md
email: test@gradeshare.com
password: password

```

## 搭載機能

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
  - 投稿、表示、編集、削除
  - ジム画像アップロード(AWS S3, Active Storage, mini_magick)
  - 住所から位置情報取得(geocoder, Geocoding API)
  - 地図表示(Google Maps API)
- レビュー投稿機能
  - 投稿、表示、削除
  - ４つの指標に対する５段階評価
  - ジムの平均評価点算出
- ホームジム機能(ジムに対するフォロー機能)
  - ホームジムの登録、登録解除
  - ホームジム一覧表示
  - ジムに所属するユーザーの一覧表示
- コメント投稿機能
  - 投稿、表示、削除
  - 自身と同じジムに所属するユーザーのコメントをタイムラインに表示
- デザイン
  - レスポンシブ(Bootstrap4)
- 検索機能(Ransack)
- ページネーション機能(kaminari)
- テスト
  - RSpec
    - 単体テスト(model spec)
    - 統合テスト(feature spec)
  - factory_bot

## 技術

- Ruby 2.6.2
- Ruby on Rails 5.2.3
- MySQL 5.6.4
- Docker
- CircleCI
- Terraform
- AWS
  - EC2
  - ECS
  - ECR
  - RDS for MySQL
  - S3
  - CloudFront
  - Route53
  - Certificate Manager
  - ALB
  - VPC
  - SES

## システム構成図

CircleCIはGitHubのリポジトリへのpushに応答して稼働します。
RSpecによるテストを実行し、ビルドしたDockerイメージをECRにpush、その後ECRからECSへデプロイしています。
デプロイしたDockerイメージはEC2インスタンス上でDockerコンテナとして稼働します。

### ポイント

###### 本番環境

- データベースはRDS for MySQL、メールサーバーにはSESを使用しています。

- 画像ファイル及びapp/assetsのファイルはS3に保存し、CloudFrontでCDN配信を行っています。

- DNSにRoute53を使用し、独自ドメインでのアクセスを可能にしています。

- ALBによりhttpによるすべてのアクセスをhttpsへリダイレクトしています。

- Terraformを用いてインフラをコード化しており、GUIを介さずにAWSの構築・変更・破棄が可能です。

###### 開発環境

- 開発はDocker環境で実施しています。
　RSpecによるテストもDockerコンテナ上で実施しています。

- bulletを使用して「N＋１」問題を解消しています。

- Rubocopを使用してソースコードの改善・整形を行っています。

## 課題

時間の都合上、下記の課題が残っています。

- テストケースの不足（主に統合テスト）
- 個人ページのページネーションのバグ
