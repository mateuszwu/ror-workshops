class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true

  has_rich_text :comment
end
