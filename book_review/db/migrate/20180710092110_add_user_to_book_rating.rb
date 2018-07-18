class AddUserToBookRating < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_ratings, :user, foreign_key: true
  end
end
