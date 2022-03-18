class Bet < ApplicationRecord
  validates :home_team_score, :away_team_score, presence: true
end
