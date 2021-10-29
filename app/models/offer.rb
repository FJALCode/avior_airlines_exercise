class Offer < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :state
  has_many :countries, through: :state, source: :countrie
  # Respetar la convencion
  validates :cost, :date, presence: true
  has_one_attached :photo_url

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:cost],
                  associated_against: {
                    state: [:name],
                    countries: [:name]
                  },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
