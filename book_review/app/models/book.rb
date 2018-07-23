class Book < ApplicationRecord
  belongs_to :user
  has_many :review_comments, dependent: :destroy
  has_many :book_ratings, dependent: :destroy

  has_attached_file :book_image,
    styles: { medium: "300x300#", thumb: "100x100>" },
    default_url: "/images/book.jpeg"

  validates_attachment_content_type :book_image, content_type: %r{\Aimage\/.*\Z}

  def rating
    return unless book_ratings.any?

    book_ratings.sum(:rating_value) / book_ratings.count.to_f
  end
end
