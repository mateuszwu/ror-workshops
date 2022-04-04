class Team < ApplicationRecord
  has_one_attached :logo

  validates :name, presence: true

  
  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
    all
  else
    where('name LIKE ?', "%#{pattern}%").distinct
  end
end

end
