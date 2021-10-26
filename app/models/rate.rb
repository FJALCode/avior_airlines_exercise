class Rate < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :name, :hand_baggage, :baggage, :cambios, :refunds, :child_discount, :miles, :seat, :cost, presence: true

end
