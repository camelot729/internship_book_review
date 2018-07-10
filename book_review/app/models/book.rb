class Book < ApplicationRecord
  belongs_to :user
  has_many :review_comments, dependent: :destroy
  has_many :book_ratings, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5}

  has_attached_file :book_image, styles: {medium: "300x300#", thumb: "100x100>"},
                    :default_url => "/images/:style/book.png"

  validates_attachment_content_type :book_image, :content_type => /\Aimage\/.*\Z/


  def rating
    book_ratings.sum(:rating_value) / book_ratings.count
  end

  private



end
