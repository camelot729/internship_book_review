class Book < ApplicationRecord
  belongs_to :user
  has_many :review_comments, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5}
end
