class Player < ApplicationRecord
  belongs_to :team

  has_one_attached :photo


  validates :player_name, presence: true
  validates :player_date_of_birth, comparison: {less_than_or_equal_to: Date.today}
end
