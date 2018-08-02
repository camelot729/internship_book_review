class RemoveBookRatingFromBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :book_rating, :integer
    remove_column :books, :review_rating, :integer
  end
end
