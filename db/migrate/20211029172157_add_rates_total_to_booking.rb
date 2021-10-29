class AddRatesTotalToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :rates_total, :decimal, default: 0.0
  end
end
