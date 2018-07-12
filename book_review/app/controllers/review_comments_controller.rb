class ReviewCommentsController < ApplicationController
  before_action :set_review_comment, only: [:show, :edit, :update, :destroy]

  # GET /review_comments
  # GET /review_comments.json
  def index
    @review_comments = ReviewComment.all
  end


  def show
  end


  def new
    @review_comment = ReviewComment.new
  end


  def edit
  end


  def create
    @book = Book.find(params[:book_id])
    @review_comment = @book.review_comments.create(review_comment_params)
    @review_comment.user = current_user

    if @review_comment.save
      redirect_to @book, notice: 'Review comment was successfully created.'
    else
      render :new
    end
  end


  def update
    if @review_comment.update(review_comment_params)
      redirect_to book_path(@review_comment.book), notice: 'Review comment was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @book = Book.find(params[:book_id])
    @review_comment = @book.review_comments.find(params[:id])
    @review_comment.destroy
    redirect_to @book, notice: 'Review comment was successfully destroyed.'
  end

  private

    def set_review_comment
      @review_comment = ReviewComment.find(params[:id])
    end


    def review_comment_params
      params.require(:review_comment).permit(:title, :body, :book_id)
    end
end
