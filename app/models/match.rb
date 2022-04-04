class Match < ApplicationRecord

    belongs_to :round
    belongs_to :team_home, class_name: 'Team'
    belongs_to :team_away, class_name: 'Team'
    validates :date, presence: true
end