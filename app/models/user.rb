class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to 	:city
  has_many		:comments
  has_many		:orders
  has_many		:books
  has_many		:posts
  has_many		:pictures
  has_many		:addresses
  has_many		:paymments
  has_many		:notifications
end
