class BookRating < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :user_id, uniqueness: { scope: :book_id }

  validates :rating_value, inclusion: { in: 0..10 }, presence: true
end
