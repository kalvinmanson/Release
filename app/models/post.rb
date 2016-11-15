class Post < ApplicationRecord
  acts_as_followable
  acts_as_mentionable
  acts_as_likeable

  belongs_to :category
  belongs_to :book
  belongs_to :user

  extend FriendlyId
  friendly_id :name, use: :slugged
end
