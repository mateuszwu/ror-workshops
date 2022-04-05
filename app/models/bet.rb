class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :match
end
