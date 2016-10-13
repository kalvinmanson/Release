class User < ApplicationRecord

  before_validation :generate_slug

  validates_presence_of :name
  validates_uniqueness_of :name


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

  #url amigable
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end



  private
  def generate_slug
    self.slug = name.to_s.parameterize
  end
end
