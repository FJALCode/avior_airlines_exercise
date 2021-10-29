class Booking < ApplicationRecord
  belongs_to :rate
  belongs_to :user
  belongs_to :offer
  validates :fec_ini, :fec_end, presence: true
  validate :initial_date_cannot_be_less_than_actual_date

  after_create_commit :update_offer_seats

  def initial_date_cannot_be_less_than_actual_date
    return if [fec_ini.blank?, fec_end.blank?].any?
    if fec_ini.to_s < Date.current.to_s
      errors.add(:fec_ini, "Date can't be less than todays date")
    elsif fec_ini >= fec_end
      errors.add(:fec_ini, "Date can't be less than ends date")
    end
  end

  private

  def update_offer_seats
    offer = self.offer
    seats = offer.seats
    available = seats - self.seats.to_i == 0 ? false : true
    offer.update(seats: (seats - self.seats.to_i), available: available)
  end
end
