class Team < ApplicationRecord
  has_one_attached :logo
  belongs_to :match

  validates :name, presence: true
end
