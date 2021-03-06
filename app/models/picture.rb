class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :post

  has_attached_file :file, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
  validates :file, presence: true
end
