class Team < ApplicationRecord
  validates :name, presence: { message: 'cannot be empty.' }
end
