class BooksController < ApplicationController
  before_action :authenticate_user!

  responders :location
  respond_to :html

  expose :book
  expose :books, -> { Book.all }
  expose :book_rating, -> { fetch_book_rating }

  def create
    book.user = current_user
    book.save
    respond_with (book)
  end

  def update
    book.user = current_user
    book.update book_params
    respond_with(book)
  end

  def destroy
    book.destroy
    respond_with(book, location: books_path)
  end

  private

  def fetch_book_rating
    current_user.book_ratings.find_by(book_id: book.id)
  end

  def book_params
    params.require(:book).permit(
      :title,
      :review,
      :book_rating,
      :review_rating,
      :publication_time,
      :book_image
    )
  end
end
