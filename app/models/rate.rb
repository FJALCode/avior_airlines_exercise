class Rate < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, uniqueness: true
end
