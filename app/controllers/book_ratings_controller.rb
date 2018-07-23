class BookRatingsController < ApplicationController
  expose :book_rating
  expose :book

  responders :location
  respond_to :html

  def create
    book_rating.book = book
    book_rating.user = current_user
    book_rating.save
    respond_with(book)
  end

  def update
    book_rating.update book_rating_params
    respond_with(book_rating, location: book_rating.book)
  end

  def destroy
    book_rating.destroy
    respond_with(book_rating, location: book_rating.book)
  end

  private

  def book_rating_params
    params.require(:book_rating).permit(
      :rating_value,
      :book_id
    )
  end
end
