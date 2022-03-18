class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :round
  has_many :bets

  validates :home_team_id, :away_team_id, :round_id, presence: true
  validate :team_uniqueness
  validate :match_uniqueness

  def team_uniqueness
    if home_team_id == away_team_id
      errors.add(:home_team_id, 'The home team has to be different from the away team')
    end
  end

  def match_uniqueness
    match1 = Match.find_by(match_date: match_date, home_team_id: home_team_id, away_team_id: away_team_id)
    match2 = Match.find_by(match_date: match_date, home_team_id: away_team_id, away_team_id: home_team_id)

    if match1.present? && match1.id != id || match2.present? && match2.id != id
      errors.add(:match_date, 'Selected teams have already scheduled match this day')
    end

    # alternative approach

    # match, = Match
    #   .where(match_date: match_date, home_team_id: home_team_id, away_team_id: away_team_id)
    #   .or(Match.where(match_date: match_date, home_team_id: away_team_id, away_team_id: home_team_id))

    # if match.present? && match.id != id
    #   errors.add(:match_date, 'Selected teams have already scheduled match this day')
    # end
  end

  def user_bet(user)
    bets.find_by(user_id: user.id)
  end
end
