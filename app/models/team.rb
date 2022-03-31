class Team < ApplicationRecord
  validates :name, presence: true
  has_one_attached :logo

end
