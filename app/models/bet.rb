class Bet < ApplicationRecord
  belongs_to :match
  belongs_to :user

  validates_uniqueness_of :user_id, scope: [:match_id]
end