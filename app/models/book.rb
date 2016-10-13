class Book < ApplicationRecord
  belongs_to	:user
  has_many		:comments
  has_many 		:notifications
  has_many		:orders
  has_many		:pictures
  has_many		:posts
  has_and_belongs_to_many :genders

  validates :user_id, presence: true
  validates :name, presence: true
  validates :name, length: { in: 6..100 }

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name,
      [:name, :author],
      [:name, :author, :publisher],
      [:name, :author, :publisher, :isbn_10],
      [:name, :author, :publisher, :isbn_10, :isbn_13]
    ]
  end
end
