class AddCoordinatesToStates < ActiveRecord::Migration[6.0]
  def change
    add_column :states, :latitude, :float
    add_column :states, :longitude, :float
  end
end
