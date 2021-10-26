class Countrie < ApplicationRecord
    has_many :states
    validates :name, uniqueness: true
end
