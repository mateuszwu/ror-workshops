class Round < ApplicationRecord
  has_many :matches
  has_many :bets, through: :matches
  has_many :away_team, class_name: Team.name, through: :matches
  has_many :home_team, class_name: Team.name, through: :matches
  has_many :users, through: :bets
end