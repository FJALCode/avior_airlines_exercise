class Offer < ApplicationRecord
  belongs_to :state
  has_many :bookings
  validates :cost, :date, presence: true
end
