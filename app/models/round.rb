class Round < ApplicationRecord
  validates :number, presence: true
  validates :year, comparison: {
    greater_than_or_equal_to: Date.today.year,
    less_than_or_equal_to: (Date.today + 1.year).year
  }
  validate :number_year_uniqueness
  # alternative solution
  # validates :number, uniqueness: { scope: :year, message: 'number/year pair has to be unique' }

  def number_year_uniqueness
    round = Round.find_by(year: self.year, number: self.number)

    if round.present? && round.id != self.id
      errors.add(:number, 'number/year pair has to be unique')
    end
  end
end
