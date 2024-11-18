class Game < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :pickup_adress
  after_validation :geocode, if: :will_save_change_to_pickup_adress?

  include PgSearch::Model
  pg_search_scope :search,
  against: [ :name, :device ],
  associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
