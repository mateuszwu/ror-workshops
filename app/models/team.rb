class Team < ApplicationRecord
  has_one_attached :logo
  has_many :players, dependent: :destroy

  validates :name, presence: true
end
