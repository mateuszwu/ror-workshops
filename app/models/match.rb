class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :round
  has_many :bets
  has_many :users, through: :bets

  validates :home_team_id, :away_team_id, :round_id, :match_date, presence: true
  validates :home_team_score, :away_team_score, presence: true, on: :update, if: -> { match_date <= Date.today }
  validate :before_match_day_score, on: :update
  validate :team_uniqueness
  validate :match_uniqueness

  def before_match_day_score
    # if match_date > Date.today
    # alternative
    if match_date.future?
      if home_team_score.present?
        errors.add(:home_team_score, "You can't set home team score before the match day")
      end

      if home_team_score.present?
        errors.add(:away_team_score, "You can't set away team score before the match day")
      end
    end
  end

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
