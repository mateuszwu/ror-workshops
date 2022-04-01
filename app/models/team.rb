class Team < ApplicationRecord
  has_one_attached :logo

  validates :name, presence: true

  def self.search(search)
    if search

    else
      
    end

  end
end
