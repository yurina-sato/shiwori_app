# 概要
### アプリケーション名
旅のしをり(Shiwori-app)

### アプリケーション説明
旅行の計画書(旅のしおり)の作成ができます。

### URL
https://shiwori-app.herokuapp.com/

### テスト用アカウント
#### メインユーザー
nickname: sample  
email:sample@sample.com  
password: sample123  

#### メンバー２
nickname: member2  
email:member2@sample.com  
password: member2123  

#### メンバー３
nickname: member3  
email:member3@sample.com  
password: member3123  

### Basic認証

# 利用方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。  
  ※デプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- 確認後は、左サイドバーのリンクからログアウト処理をお願いいたします。

## しおり
1. テストアカウントでログイン  
1. トップページ左の**しおり作成**リンクを押下  
1. しおり情報入力
  ※参加メンバーを複数人選択する場合は、CtrlやShiftキーを押しながら選択してください  
1. 作成ボタンを押下

## スケジュール・イベント
- テストアカウントでログイン  

**スケジュール**  
1. トップページのしおり一覧から、スケジュールページを作成するしおり(アイコン)を押下
1. 左サイドバーの**スケジュール作成**リンクを押下  
1. スケジュール情報入力
1. 作成ボタンを押下

**イベント**
1. しおり詳細ページから、イベントを作成するスケジュール(アイコン)を押下
1. 左サイドバーの**イベント作成**リンクを押下 
1. イベント情報入力  
1. 作成ボタンを押下  

## リスト・アイテム(リスト項目)
- テストアカウントでログイン  

**リスト**
1. トップページのしおり一覧から、リストを作成するしおり(アイコン)を押下
1. 左サイドバーの**リスト作成**リンクを押下  
1. リスト情報入力  
1. 作成ボタンを押下  

**アイテム(リスト項目)**
1. しおり詳細ページから、アイテム(リスト項目)を作成するリスト(アイコン)を押下
1. 左サイドバーの**リスト項目作成**リンクを押下 
1. アイテム(リスト項目)情報入力
  ※画像を複数枚添付する場合は、CtrlやShiftキーを押しながら選択してください  
1. 作成ボタンを押下


# 制作背景・目指した課題解決
20代前後の友人同士で、週末や連休で旅行に行くことを想定した際、自身の経験から下記の課題を洗い出しました。

- メッセージアプリのグループで共有すると、予約情報などを決まり次第送り合うので古いものは埋もれてしまう  
  →旅行前の情報共有を時系列で管理したい

- 旅行計画は気付いたらリーダーになっていて、仕事が沢山  
  →簡単にメンバーと分担したい

- 旅行後は写真をメンバーが各々まとめて送り合うので、写真フォルダが溢れかえってしまう  
  →日付やイベント毎に写真をまとめたい

- 最終的にいくらになるか、誰が建て替えてていくら渡すのかなど、お金の管理が複雑になりやすい  
  →自動で一人当たりの金額を計算したい、お金のやり取りを気軽にメモしたい


これらの課題は、
**修学旅行で使ったような「旅のしおり」があれば解決できるのでは？、**
と考えました。  
以上から、「ペーパーレス時代の旅のしおり」を簡単に作れるアプリケーションの制作を目標にしています。

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
時系列で並ぶイベントに写真が紐付くことで、旅行後も振り返りやすくなると考えています。

### リスト管理機能
旅行毎にリスト形式のメモを作成する機能です。  
計画時のToDoや、買い物、持ち物などをリストの形で管理することができます。

### アイテム機能
リストに投稿する一つひとつの項目を作成します。  
実行したらクリックすることで、色を薄くして他アイテムと区別できる仕様を想定しています。

### 金額計算機能
イベント毎にかかる費用を記録し、一人あたりの旅行金額を算出する機能です。  
各イベントの合計金額を計算し、1日毎(スケジュールページ毎)の金額を計算します。
更に、各日毎の金額を合算し、旅行全体の合計金額を出します。


# 実装した機能についての画像・GIFと説明

### しおり
<img width="400" alt="shiwori-img" src="https://user-images.githubusercontent.com/70574115/98529656-364d4c00-22c1-11eb-9d88-8102341ed903.png">
トップページから旅行毎にしおりを作成することが出来ます。  
作成したしおりの詳細ページには、しおりに紐付いたスケジュールとリストがそれぞれアイコンで表示されます。
各アイコンを押下することで、詳細ページへ遷移します。


### スケジュール・イベント
![shiwori-sche-demo](https://user-images.githubusercontent.com/70574115/98528918-4dd80500-22c0-11eb-9a3a-9bafba27b44f.gif)  
しおり詳細から1日毎のスケジュールページを作成することができます。  
また、スケジュール内にイベントを作成すると、スケジュール詳細ページに時系列で並んで表示されます。  
なお、イベントには画像を添付できます。添付画像はイベント詳細ページにてスライド形式で確認できるため、旅行後のアルバムとしても活用可能です。


### リスト・アイテム(リスト項目)
![shiwori-list-demo](https://user-images.githubusercontent.com/70574115/98533902-fb4e1700-22c6-11eb-9a8e-7b4a0d7b103c.gif)  
しおり詳細からリストページを作成することが出来ます。  
また、リスト内に項目を作成すると、作成順に並んで表示されます。  
項目はクリックすると色がグレーに変わるので、実行済の項目を区別して管理することが可能です。


# 実装予定の機能・課題
## 追加実装予定の機能
### チャットルーム機能
旅行毎にメンバーとやり取りができるチャットルームを作成します。  
普段使うメッセージアプリのグループとは他に、旅行専用でチャットルームがあることで、情報が埋もれずスムーズな共有ができると考えています。  
更新履歴や旅先情報のURLを投稿する、掲示板のようなイメージを想定しています。

### メッセージ投稿機能
チャットルームにメッセージを投稿します。  
テキストに限らず、画像を添付できる仕様を想定しています。

### PDF出力機能
しおりページ、スケジュール、リストをPDFで出力できる機能です。  
学生サークルや社員旅行のような大人数の場合に、編集権限のないメンバーへもしおり共有をできるように実装したいと考えています。

## 改良したい課題
- 画像プレビューの改良(プレビュー上で画像の差し替えや削除)
- メンバー選択フォームの改良
- しおりへ参加するユーザーの招待制、主催者の設定

# データベース設計
## ER図
<img width="600" alt="shiwori-ER1109" src="https://user-images.githubusercontent.com/70574115/98512630-f3cc4500-22a9-11eb-9ca2-50aa25eedecc.png">


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
- has_many :trip_users
- has_many :users, through: :trip_users
- has_many :schedules
- has_many :events, through: :schedules
- has_many :lists
- has_many :items, through: :lists
<!-- - has_one :room -->

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
| text      | text       |                                |
| checked   | boolean    |                                |
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
`% git clone https://github.com/yurina-sato/shiwori_app.git`  
`% cd shiwori_app`  
`% bundle install`  
`% rails db:create`  
`% rails db:migrate`  
`% rails s`  
  → http://localhost:3000 で接続

# 使用技術・開発環境
#### バックエンド
Ruby, Ruby on Rails

#### フロントエンド
HTML, CSS, JavaScript, jQuery

#### データベース
MySQL

#### インフラ
AWS(S3) ※画像サーバー  
Heroku ※本番環境

#### ソース管理
GitHub, GitHubDesktop

#### エディタ
VSCode




