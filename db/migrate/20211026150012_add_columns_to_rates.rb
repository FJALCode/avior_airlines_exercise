class AddColumnsToRates < ActiveRecord::Migration[6.0]
  def change
    add_column :rates, :name, :string
    add_column :rates, :hand_baggage, :string
    add_column :rates, :baggage, :string
    add_column :rates, :changes, :string
    add_column :rates, :refunds, :string
    add_column :rates, :child_discount, :string
    add_column :rates, :miles, :string
    add_column :rates, :seat, :string
    add_column :rates, :cost, :integer
  end
end
