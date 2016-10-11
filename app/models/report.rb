class Report < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :book
  belongs_to :post
end
