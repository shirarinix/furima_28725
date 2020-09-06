class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.string :introduction,   null: false
      t.string :category_id,    null: false
      t.string :product_id,     null: false
      t.string :delivery_id,    null: false
      t.string :prefecture_id,  null: false
      t.string :preparation_id, null: false
      t.string :selling_price,  null: false
      t.string :user_id,        null: false
      t.timestamps
    end
  end
end
