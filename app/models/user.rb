class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :book_ratings, dependent: :destroy

  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100#" },
    default_url: ":style/missing.jpeg"

  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
end
