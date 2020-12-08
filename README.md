## userテーブル

| Columns  | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |


### Association
- has_many :counts

## countテーブル

| Columns     | Type      | Options           |
| ------------| --------- | ----------------- |
| name        | string    | null: false       |
| trials      | integer   |                   |
| remark      | string    |                   |
| category_id | integer   | null: false       |
| release_id  | integer   | null: false       |
| user        | reference | foreign_key: true |

### Association
- has_many :details
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :release

## detailテーブル
| Columns       | Type      | Options           |
| ------------  | --------- | ----------------- |
| title         | string    |                   |
| number        | integer   |                   |
| probability   | integer   |                   |
| count         | reference | foreign_key: true |

### Association
- belongs_to :count

## ActiveStorage
- image

## ActiveHash
- category
- release

## アプリケーション名
- count.app

## 概要
集計用のアプリで、集計欄の数は用途に沿って調整できます。
また、集計は基本的にクリックのみで完了するようにしてます。

## URL
- https://count-30866.herokuapp.com/

## テスト用アカウント
- email:test@test
- pass :aaa111

## 利用方法
- ログアウト状態は投稿された集計の結果のみ見れます
- 新規集計を行う場合、up/down/calcなどのボタンの機能を使用する際は事前にsetボタンを押してください
- 新規投稿時に非公開設定した場合は本人しか投稿結果を見れないようになります

## 目指した課題解決
- 用途に応じて集計欄が増やすことができ、集計結果が簡単に閲覧できることが目的

## 要件
- 追加ボタンを押すと集計部分のフォームが増加すること
- 削除を押すと該当する集計フォームを削除できること
- setボタンを押した後に、up/downボタンをクリックすると数値が増減すること
- setボタンを押した後に、calcボタンを押すと確率計算ができること
- 非公開設定にしたものは本人以外閲覧できないこと

## 環境
- ruby ver6.0.0