class Offer < ApplicationRecord
  belongs_to :state
  validates :cost, :date, presence: true
end
