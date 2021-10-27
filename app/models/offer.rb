class Offer < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :state
  validates :cost, :date, presence: true
end
