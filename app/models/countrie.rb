class Countrie < ApplicationRecord
    has_many :states, dependent: :destroy
    validates :name, uniqueness: true
    validates :name, presence: true
end
