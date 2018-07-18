class BooksController < ApplicationController
  before_action :authenticate_user!

  expose :book
  expose :books, -> { Book.all }
  expose :book_rating, -> { fetch_book_rating }

  def show

  end

  def create
    book.user = current_user
    if book.save
      redirect_to book,
        notice: "Book was successfully created."
    else
      render :new
    end
  end

  def update
    book.user = current_user
    if book.update(book_params)
      redirect_to book,
        notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book.destroy
    redirect_to books_url,
      notice: "Book was successfully destroyed."
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
