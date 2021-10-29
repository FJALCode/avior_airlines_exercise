class Countrie < ApplicationRecord
    has_many :states, dependent: :destroy
    has_many :offers, through: :state  # added
    validates :name, uniqueness: true
    validates :name, presence: true
end
