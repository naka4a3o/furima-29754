# テーブル設計

## users テーブル

| Column          	| Type  	| Options       |
|-----------------	|--------	|-------------	|
| nickname        	| string 	| null: false 	|
| email           	| string 	| null: false 	|
| password        	| string 	| null: false 	|
| birth_date      	| date   	| null: false 	|
| last_name       	| string 	| null: false 	|
| first_name      	| string 	| null: false 	|
| last_name_kana  	| string 	| null: false 	|
| first_name_kana 	| string 	| null: false 	|

### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column                	| Type       	| Options                        	|
|-----------------------	|------------	|--------------------------------	|
| name                  	| string     	| null: false                    	|
| description           	| text       	| null: false                    	|
| category_id           	| integer    	| null: false                    	|
| item_status_id          | integer    	| null: false                    	|
| price                 	| integer    	| null: false                    	|
| shipping_bearer_id    	| integer    	| null: false                    	|
| item_prefecture_id    	| integer    	| null: false                    	|
| scheduled_delivery_id 	| integer    	| null: false                    	|
| user                  	| references 	| null: false, foreign_key: true 	|

### Association

- has_one :buyer
- belongs_to :user

##  buyersテーブル

| Column 	| Type        | Options                        	|   	|
|--------	|------------	|--------------------------------	|---	|
| user   	| references 	| null: false, foreign_key: true 	|   	|
| item   	| references 	| null: false, foreign_key: true 	|   	|
| address 	| references 	| null: false, foreign_key: true 	|   	|

### Association

- has_one :addresses
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column        	| Type       	| Options                        	|
|---------------	|------------	|--------------------------------	|
| postal_code   	| string    	| null: false                    	|
| prefecture_id 	| integer    	| null: false                    	|
| city          	| string     	| null: false                    	|
| house_number  	| string     	| null: false                    	|
| building_name 	| string     	|                                	|
| phone_number  	| string    	| null: false                    	|
| buyer          	| references 	| null: false, foreign_key: true 	|

### Association

- belongs_to :buyer

