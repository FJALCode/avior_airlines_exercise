class Booking < ApplicationRecord
  belongs_to :rate
  belongs_to :user
  belongs_to :state
end
