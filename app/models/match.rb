class Match < ApplicationRecord
    validate :expiration_teams_is_another
    belongs_to :round
    belongs_to :home_team, class_name: "Team"
    belongs_to :away_team, class_name: "Team"
    validates :date, presence: true

    has_many :teams

    def expiration_teams_is_another
      if home_team_id == away_team_id
        errors.add(:home_team,"have to play with another  team")
      end
    end
  end
