class Rate < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :type, :penalty, :weight, :cost, presence: true

end
