class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :bets
  has_many :matches, through: :bets

  def full_name
    "#{first_name} #{last_name}"
  end

  def points
    bets.sum(:points)
  end

  def points_per_match(match)
    bets.where(match_id: match).first.points
  end
end
