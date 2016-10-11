class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :rank
  belongs_to :paymment
  belongs_to :book
end
