class AddColumnToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :fec_ini, :date
    add_column :bookings, :fec_end, :date
  end
end
