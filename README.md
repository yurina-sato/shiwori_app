# アプリケーション概要
旅のしをり
説明：このアプリケーションでできること
URL:デプロイ次第記述

## テスト用アカウント
ログインユーザー
Basic認証

## 利用方法
このアプリケーションの利用方法

## 目指した課題解決
このアプリケーションを通じて、どのような人の、どのような課題を解決したかったか


## 洗い出した要件
スプレッドシートにまとめた要件定義を、マークダウンで記述しなおし

## 実装した機能についてのGIFと説明
実装した機能について、それぞれどのような特徴があるのか列挙

## 実装予定の機能
洗い出した要件の中から、今後実装予定のもの

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

アプリケーション開発に使用した環境を併記





