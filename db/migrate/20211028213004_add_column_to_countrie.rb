class AddColumnToCountrie < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :iso2, :string
  end
end
