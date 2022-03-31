class Team < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }

    has_one_attached :avatar
  end
