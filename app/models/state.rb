class State < ApplicationRecord
  belongs_to :countrie
  has_many :offers
end
