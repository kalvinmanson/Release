class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :post
  belongs_to :user
end
