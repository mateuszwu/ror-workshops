class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 30 }

  belongs_to :user
  has_many :comments

  has_rich_text :content
end
