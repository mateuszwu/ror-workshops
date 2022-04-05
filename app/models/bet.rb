class Bet < ApplicationRecord
belongs_to :user, class_name: 'User'
belongs_to :match, class_name: 'Match'

end
# validates :home_team_id, :away_team_id, :round_id, :match_date, presence: true
# validate :team_uniqueness
# validate :match_uniqueness
#
# def team_uniqueness
#   if home_team_id == away_team_id
#     errors.add(:home_team_id, 'The home team has to be different from the away team')
#   end
# end
#
# def match_uniqueness
#   match1 = Match.find_by(match_date: match_date, home_team_id: home_team_id, away_team_id: away_team_id)
#   match2 = Match.find_by(match_date: match_date, home_team_id: away_team_id, away_team_id: home_team_id)
#
#   if match1.present? && match1.id != id || match2.present? && match2.id != id
#     errors.add(:match_date, 'Selected teams have already scheduled match this day')
#   end