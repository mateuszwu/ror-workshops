class Bet < ApplicationRecord
  belongs_to :match
  validates :home_team_score, :away_team_score, presence: true
end
