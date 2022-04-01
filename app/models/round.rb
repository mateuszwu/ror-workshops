class Round < ApplicationRecord
  validates :number, uniqueness: { scope: :year}
end