class Team < ApplicationRecord
  validates :name, presence: true
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
end
