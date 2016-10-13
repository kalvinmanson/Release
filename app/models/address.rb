class Address < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :address, presence: true

end
