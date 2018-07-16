class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:update, :destroy]

  expose :book
  expose :books, -> {Book.all}
  expose :book_rating, ->{current_user.book_ratings.find_by(book_id: params[:id])}
  expose :overall_rating, ->{Book.find(params[:id]).rating}


  def show
    unless book_rating
      book_rating = book.book_ratings.new
    end
    overall_rating
  end

  def create
    book = current_user.books.new(book_params)
    if book.save
      redirect_to book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    book = current_user.book.find(params[:id])
    if book.update(book_params)
      redirect_to book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    def set_book
      book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :review, :book_rating, :review_rating, :publication_time, :book_image)
    end
end
