class User < ApplicationRecord

  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
  acts_as_mentionable
  acts_as_messageable

  before_validation :generate_slug

  validates_presence_of :name
  validates_uniqueness_of :name

  devise :omniauthable, :omniauth_providers => [:facebook]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  belongs_to 	:city
  has_many		:comments
  has_many		:orders
  has_many		:books
  has_many		:posts
  has_many		:pictures
  has_many		:addresses
  has_many		:paymments
  has_many		:notifications

  #email_mailboxer
  def mailboxer_email(object)
   #return the model's email here
   email
  end

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image # assuming the user model has an image
    end
  end

  private
    def generate_slug
      self.slug = name.to_s.parameterize
    end
end
