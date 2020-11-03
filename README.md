# アプリケーション概要
### 旅のしをり
- 説明：このアプリケーションでできること
- URL:デプロイ次第記述

## テスト用アカウント
### ログインユーザー
### Basic認証

## 利用方法
このアプリケーションの利用方法

## 制作背景・目指した課題解決
週末や連休で旅行に行くことを想定した際、自身の経験から下記の課題を洗い出しました。

- LINEグループなどメッセージアプリで共有すると、予約情報などを決まり次第送り合うので古いものは埋もれてしまう 
  →旅行前の情報共有を時系列で管理したい

- 旅行計画は気付いたらリーダーになっていて、仕事が沢山 
  →簡単にメンバーと分担したい

- 旅行後は写真をメンバーが各々まとめて送り合うので、写真フォルダが溢れかえってしまう 
  →日付やイベント毎に写真をまとめたい

- 割り勘でいくらになるか、誰が建て替えてていくら渡すのかなど、お金の管理が複雑になりやすい 
  →自動で割り勘金額を計算したい、お金のやり取りを気軽にメモしたい


これらの課題は、
**修学旅行で使ったような「旅のしおり」があれば解決できるのでは？、**
と考えました。
以上から、旅のしおりを簡単に作れるアプリケーションの制作を目標にしています。

## 洗い出した要件
スプレッドシートにまとめた要件定義を、マークダウンで記述しなおし
- ユーザー管理機能
- しおり機能
- スケジュール機能
- イベント機能
- 写真投稿機能
- リスト管理機能
- アイテム機能
- 金額計算機能
- チャットルーム機能
- メッセージ投稿機能
- PDF出力機能

## 実装した機能についてのGIFと説明
実装した機能について、それぞれどのような特徴があるのか列挙

## 実装予定の機能
洗い出した要件の中から、今後実装予定のもの

- チャットルーム機能
- メッセージ投稿機能
- PDF出力機能


# データベース設計
## ER図


## usersテーブル(devise)
| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| email           | string     | null: false |
| password        | string     | null: false |
| nickname        | string     | null: false |

### Association
- has_many :trip_users
- has_many :trips, through: :trip_users
- has_many :message


## tripsテーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| text        | text       | null: false |
| destination | string     | null: false |
| days        | integer    | null: false |

### Association
- has_many :lists
- has_many :schedules
- has_one :room
- has_many :trip_users
- has_many :users, through: :trip_users


## trip_usersテーブル (中間テーブル)
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| trip   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :trip
- belongs_to :user


## schedulesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| text    | text       | null: false                    |
| trip_id | references | null: false, foreign_key: true |

### Association
- belongs_to :trip
- has_many :events


## eventsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| text        | text       | null: false                    |
| date        | date       | null: false                    |
| start_time  | time       | null: false                    |
| finish_time | time       | null: false                    |
| place       | text       | null: false                    |
| url         | text       |                                |
| price       | integer    |                                |
| schedule    | references | null: false, foreign_key: true |

### Association
- belongs_to :schedule
- has_many_attached :images


## listsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| text   | text       | null: false                    |
| trip   | references | null: false, foreign_key: true |

### Association
- belongs_to :trip
- has_many :items


## itemsテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| text      | text       | null: false                    |
| checked   | boolean    | null: false                    |
| list      | references | null: false, foreign_key: true |

### Association
- belongs_to :list


## roomsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| text   | text       | null: false                    |
| trip   | references | null: false, foreign_key: true |

### Association
- belongs_to :trip
- has_many :messages


## messagesテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| room      | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user
- has_one_attached :image

# ローカルでの動作方法
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述

# 使用技術・開発環境
### バックエンド
Ruby, Ruby on Rails

### フロントエンド
HTML, CSS

### データベース
MySQL

### インフラ
AWS(S3)　※画像サーバー  
Heroku　※本番環境

### ソース管理
GitHub, GitHubDesktop

### エディタ
VSCode




