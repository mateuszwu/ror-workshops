class Match < ApplicationRecord
  has_many :bets
  belongs_to :away_team, class_name: Team.name
  belongs_to :home_team, class_name: Team.name
  belongs_to :round
  has_many :users, through: :bets
end