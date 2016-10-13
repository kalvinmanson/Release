class Gender < ApplicationRecord
  has_and_belongs_to_many :books

  extend FriendlyId
  friendly_id :name, use: :slugged
end
