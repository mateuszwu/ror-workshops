class Bet < ApplicationRecord

validates :home_team_score, :away_team_score, :match_id, :user_id, presence: true

end