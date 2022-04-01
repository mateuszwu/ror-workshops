class Team < ApplicationRecord
  has_one_attached :logo

  validates :name, presence: true


  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
