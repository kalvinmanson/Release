class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :post
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { in: 10..150 }

  default_scope { order('created_at DESC') }
end
