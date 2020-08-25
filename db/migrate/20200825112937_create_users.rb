class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email 
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :sex_kana
      t.string :name_kana
      t.date :birthday
      t.timestamps
    end
  end
end
