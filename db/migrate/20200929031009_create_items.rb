class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                        null: false
      t.text :description,                   null: false
      t.integer :category_id,                null: false
      t.integer :item_status_id,             null: false
      t.integer :price,                      null: false
      t.integer :shipping_bearer_id,         null: false
      t.integer :item_prefecture_id,         null: false
      t.integer :scheduled_delivery_id,      null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
