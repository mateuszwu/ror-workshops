class Team < ApplicationRecord
  validates :name, presence: true
  validates :avatar, presence: true
end
