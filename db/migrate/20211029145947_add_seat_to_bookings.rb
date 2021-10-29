class AddSeatToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :seats, :integer
  end
end
