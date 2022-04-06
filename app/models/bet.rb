class Bet < ApplicationRecord
  validates :home_team_score, :away_team_score, presence: true
  belongs_to :user
  belongs_to :match
end
