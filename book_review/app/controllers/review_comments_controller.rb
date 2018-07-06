class ReviewCommentsController < ApplicationController
  before_action :set_review_comment, only: [:show, :edit, :update, :destroy]

  # GET /review_comments
  # GET /review_comments.json
  def index
    @review_comments = ReviewComment.all
  end

  # GET /review_comments/1
  # GET /review_comments/1.json
  def show
  end

  # GET /review_comments/new
  def new
    @review_comment = ReviewComment.new
  end

  # GET /review_comments/1/edit
  def edit
  end

  # POST /review_comments
  # POST /review_comments.json
  def create

    @book = Book.find(params[:book_id])
    @review_comment = @book.review_comments.create(review_comment_params)
    @review_comment.user = current_user

    # redirect_to book_path(@book)

    respond_to do |format|
      if @review_comment.save
        format.html { redirect_to @book, notice: 'Review comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /review_comments/1
  # PATCH/PUT /review_comments/1.json
  def update
    respond_to do |format|
      if @review_comment.update(review_comment_params)
        format.html { redirect_to book_path(@review_comment.book), notice: 'Review comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /review_comments/1
  # DELETE /review_comments/1.json
  def destroy
    @book = Book.find(params[:book_id])
    @review_comment = @book.review_comments.find(params[:id])
    @review_comment.destroy
    respond_to do |format|
      format.html { redirect_to @book, notice: 'Review comment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_comment
      @review_comment = ReviewComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_comment_params
      params.require(:review_comment).permit(:title, :body, :book_id)
    end
end
