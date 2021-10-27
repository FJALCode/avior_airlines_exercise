class State < ApplicationRecord
  has_many :offers, dependent: :destroy
  belongs_to :countrie
  validates :name, presence: true
end
