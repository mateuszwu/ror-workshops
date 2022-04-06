class Bet < ApplicationRecord
    belongs_to :match, class_name: 'Match'
    belongs_to :user, class_name: 'User'

  end