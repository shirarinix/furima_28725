class RenameFirastNameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :firast_name, :first_name
  end
end
