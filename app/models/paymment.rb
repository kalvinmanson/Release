class Paymment < ApplicationRecord
  belongs_to	:user
  has_one		:rank
end
