class Match < ApplicationRecord
    belongs_to :round
    belongs_to :home_team, class_name: "Team"
    belongs_to :away_team, class_name: "Team"
    validates :date, presence: true

    has_many :teams
  end
