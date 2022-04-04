class Round < ApplicationRecord

    validates :year, presence: true
    validates :number, presence: true

    has_many :matches

end