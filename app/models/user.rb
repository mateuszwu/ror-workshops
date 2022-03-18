class User < ApplicationRecord
  has_many :bets

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_points
    bets.sum(:points)
  end
end
