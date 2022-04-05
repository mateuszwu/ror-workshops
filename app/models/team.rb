class Team < ApplicationRecord
  has_many :away_matches, class_name: Match.name, foreign_key: 'away_team_id'
  has_many :home_matches, class_name: Match.name, foreign_key: 'home_team_id'
  has_one_attached :logo
  validates :name, presence: true
end
