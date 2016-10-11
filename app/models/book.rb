class Book < ApplicationRecord
  belongs_to	:user
  has_many		:comments
  has_many 		:notifications
  has_many		:orders
  has_many		:pictures
  has_many		:posts
  has_and_belongs_to_many :genders
end
