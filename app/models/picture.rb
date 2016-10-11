class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :post
end
