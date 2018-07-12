class BookRatingsController < ApplicationController
  before_action :set_book_rating, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @book_rating = BookRating.new
  end

  def edit
    @book = Book.find(params[:book_id])
    @book_rating = current_user.book_ratings.find(params[:id])
  end

  def create
    @book = Book.find(params[:book_id])
    @book_rating = @book.book_ratings.new(book_rating_params)
    @book_rating.user = current_user

    if @book_rating.save
      redirect_to @book, notice: 'Book rating was successfully created.'
    else
      render :new
    end

  end

  def update
    @book = Book.find(params[:book_id])
    if @book_rating.update(book_rating_params)
      redirect_to @book_rating.book, notice: 'Book rating was successfully updated.'
    else
      render :edit
    end

  end

  def destroy
    @book_rating.destroy
    redirect_to book_ratings_url, notice: 'Book rating was successfully destroyed.'
  end

  private
    def set_book_rating
      @book_rating = BookRating.find(params[:id])
    end

    def book_rating_params
      params.require(:book_rating).permit(:rating_value, :book_id)
    end
end
