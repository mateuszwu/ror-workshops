class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bets
  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end

  def has_bets?(round)
    round.matches.first.bets.where(user_id: id).count > 0
  end

  def points(round)
    round.matches.first.bets.where(user_id: id).sum(:points)
  end

  def points_from_match(match)
    bets.find_by(match: match).points
  end
end
