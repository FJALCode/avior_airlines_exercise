class State < ApplicationRecord
  belongs_to :countrie
  has_many :offers
  validates :name, uniqueness: true
end
