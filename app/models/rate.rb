class Rate < ApplicationRecord
  has_many :bookings
  validates :name, uniqueness: true, presence: true
  validates :name, :hand_baggage, :baggage, :cambios, :refunds, :child_discount, :miles, :seat, :cost, presence: true

end
