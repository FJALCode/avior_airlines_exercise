class Countrie < ApplicationRecord
    has_many :states
    validates :name, uniqueness: true
    validates :name, presence: true
end
