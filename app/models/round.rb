class Round < ApplicationRecord
  validates :number, uniqueness: { scope: :year, message: " - Round of this number is already scheduled on this year" }
end