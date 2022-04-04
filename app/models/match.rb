class Match < ApplicationRecord
  validates :match_date, presence: true

  belongs_to :round
end
