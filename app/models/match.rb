class Match < ApplicationRecord
  belongs_to :round
  has_many :teams
end
