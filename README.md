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
| release_id  | integer   |                   |
| user        | reference | foreign_key: true |

### Association
- has_many :details
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :release

## detailテーブル
| Columns      | Type      | Options           |
| ------------ | --------- | ----------------- |
| title        | string    |                   |
| count        | integer   |                   |
| probability  | integer   |                   |
| count        | reference | foreign_key: true |

### Association
- belongs_to :count

## ActiveStorage
- image

## ActiveHash
- category
- release