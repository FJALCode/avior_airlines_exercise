class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :id_number, :string
    add_column :users, :phone, :string
    add_column :users, :birthdate, :date
  end
end
