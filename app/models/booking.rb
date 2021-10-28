class Booking < ApplicationRecord
  belongs_to :rate
  belongs_to :user
  belongs_to :offer
  validates :date, presence: true
  validates :fec_ini, :fec_end, presence: true
  validate :initial_date_cannot_be_less_than_actual_date

  def initial_date_cannot_be_less_than_actual_date
    return if [fec_ini.blank?, fec_end.blank?].any?
    if fec_ini.to_s < Date.current.to_s
      errors.add(:fec_ini, "Date can't be less than todays date")
    elsif fec_ini > fec_end
      errors.add(:fec_ini, "Date can't be less than ends date")
    end
  end
end
