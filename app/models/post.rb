class Post < ApplicationRecord
  belongs_to :category
  belongs_to :book
  belongs_to :user
end
