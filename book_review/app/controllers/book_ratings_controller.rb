class BookRatingsController < ApplicationController
  before_action :set_book_rating, only: [:show, :edit, :update, :destroy]

  # GET /book_ratings
  # GET /book_ratings.json
  def index
    @book_ratings = BookRating.all
  end

  # GET /book_ratings/1
  # GET /book_ratings/1.json
  def show

  end

  # GET /book_ratings/new
  def new
    @book_rating = BookRating.new
  end

  # GET /book_ratings/1/edit
  def edit
    @book = Book.find(params[:book_id])
    @book_rating = current_user.book_ratings.find(params[:id])
  end

  # POST /book_ratings
  # POST /book_ratings.json
  def create
    @book = Book.find(params[:book_id])
    @book_rating = @book.book_ratings.new(book_rating_params)
    @book_rating.user = current_user
    respond_to do |format|
      if @book_rating.save
        format.html { redirect_to @book, notice: 'Book rating was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /book_ratings/1
  # PATCH/PUT /book_ratings/1.json
  def update
    respond_to do |format|
      if @book_rating.update(book_rating_params)
        format.html { redirect_to @book_rating.book, notice: 'Book rating was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /book_ratings/1
  # DELETE /book_ratings/1.json
  def destroy
    @book_rating.destroy
    respond_to do |format|
      format.html { redirect_to book_ratings_url, notice: 'Book rating was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_rating
      @book_rating = BookRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_rating_params
      params.require(:book_rating).permit(:rating_value, :book_id, :user_id)
    end
end
