class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :state, null: false, foreign_key: true
      t.integer :cost
      t.date :date

      t.timestamps
    end
  end
end
