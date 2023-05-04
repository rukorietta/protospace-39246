# テーブル設計

## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| email              | string | NOT NULL: unique: true |
| encrypted_password | string | NOT NUL                |
| name               | string | NOT NUL                |
| profile            | text   | NOT NUL                |
| occupation         | text   | NOT NUL                |
| position           | text   | NOT NUL                |


### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column       | Type       | Options     |
| -------------| ---------- | ----------- |
| title        | string     | NOT NUL           |
| catch_copy   | text       | NOT NUL           |
| concept      | text       | NOT NUL           |
| user         | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | NOT NUL                        |
| prototype | references | NOT NUL, foreign_key: true     |
| user      | references | NOT NUL, foreign_key: true     |

### Association

- belongs_to :user
- belongs_to :prototype