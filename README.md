# 概要
### アプリケーション名
旅のしをり(Shiwori-app)

### アプリケーション説明
旅行の計画書(旅のしおり)を作成、共有ができます。

### URL
デプロイ次第記述

### テスト用アカウント
メインユーザー
メンバー２
メンバー３

### Basic認証

# 利用方法
このアプリケーションの利用方法

### しおり

### スケジュール・イベント

### リスト

# 制作背景・目指した課題解決
週末や連休で旅行に行くことを想定した際、自身の経験から下記の課題を洗い出しました。

- メッセージアプリのグループで共有すると、予約情報などを決まり次第送り合うので古いものは埋もれてしまう  
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

# 洗い出した要件

### ユーザー管理機能(devise)
しおり毎に参加者を紐づけられるよう、アプリケーション利用にユーザー登録を行います。  

### しおり機能 
旅行毎の大枠となるページを作成します。  
旅行毎のトップページとなり、旅行の概要、メンバー、スケジュール、リストを管理します。

### スケジュール機能
旅行の1日毎のスケジュールを、時系列で管理できるページを作成します。  
(1泊2日であれば、2ページ必要になるイメージです。)   
ページ内では、イベントを時系列毎に並べて表示します。

### イベント機能
旅行1日のスケジュール内の、移動、食事、観光、体験、買い物…といった細かい一つひとつのイベントを作成します。

### 写真投稿機能
イベント毎に写真を投稿できる機能です。  
イベントに紐付くことで写真も時系列で並ぶため、旅行後も振り返りやすくなると考えています。

### リスト管理機能
旅行毎にリスト形式のメモを作成する機能です。  
計画時のToDoや、買い物、持ち物などをリストの形で管理することができます。

### アイテム機能
リストに投稿する一つひとつの項目を作成します。  
実行したらボックスにチェックをできる仕様を想定しています。

### 金額計算機能
イベント毎にかかる費用を記録し、合計金額と一人あたりの割り勘金額を算出する機能です。  
各イベントの合計金額を計算し、しおりに紐づいたユーザー数で割って計算します。


# 実装した機能についてのGIFと説明
実装した機能について、それぞれどのような特徴があるのか列挙

# 実装予定の機能・課題
### チャットルーム機能
旅行毎にメンバーとやり取りができるチャットルームを作成します。  
普段使うメッセージアプリのグループとは他に、旅行専用でチャットルームがあることで、情報が埋もれずスムーズな共有ができると考えています。  
更新履歴や旅先情報のURLを投稿する、掲示板のようなイメージを想定しています。

### メッセージ投稿機能
チャットルームにメッセージを投稿します。  
テキストに限らず、画像を添付できる仕様を想定しています。

### PDF出力機能
しおりページ、スケジュール、リストをPDFで出力できる機能です。  
学生サークルや企のような大人数での旅行の場合に、編集権限のないメンバーへもしおり共有をできるように実装したいと考えています。

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
<!-- - has_many :message -->


## tripsテーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| text        | text       | null: false |
| destination | string     | null: false |
| start_day   | date       | null: false |
| finish_day  | date       | null: false |


### Association
- has_many :lists
- has_many :schedules
<!-- - has_one :room -->
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
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| day       | date       | null: false                    |
| text      | text       | null: false                    |
| trip      | references | null: false, foreign_key: true |

### Association
- belongs_to :trip
- has_many :events


## eventsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| text        | text       |                                |
| day         | date       | null: false                    |
| start_time  | time       | null: false                    |
| finish_time | time       | null: false                    |
| place       | text       |                                |
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
| text   | text       |                                |
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

<!-- 
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
- has_one_attached :image -->

# ローカルでの動作方法
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述

# 使用技術・開発環境
#### バックエンド
Ruby, Ruby on Rails

#### フロントエンド
HTML, CSS

#### データベース
MySQL

#### インフラ
AWS(S3)　※画像サーバー  
Heroku　※本番環境

#### ソース管理
GitHub, GitHubDesktop

#### エディタ
VSCode




