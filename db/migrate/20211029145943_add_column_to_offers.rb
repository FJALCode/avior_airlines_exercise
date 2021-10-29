class AddColumnToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :available, :boolean
    add_column :offers, :seats, :integer
  end
end
