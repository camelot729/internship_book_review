class BookRating < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :user_id, uniqueness: { scope: :book_id }

  validates_numericality_of :rating_value, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10

end
