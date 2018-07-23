class ReviewCommentsController < ApplicationController
  expose :review_comments
  expose :review_comment
  expose :book

  responders :location
  respond_to :html

  def create
    review_comment = book.review_comments.create(review_comment_params)
    review_comment.user = current_user
    review_comment.save
    respond_with(review_comment.book, location: book)
  end

  def update
    review_comment.update(review_comment_params)
    respond_with(review_comment, location: review_comment.book)
  end

  def destroy
    review_comment = book.review_comments.find(params[:id])
    review_comment.destroy
    respond_with(review_comment.book, location: book)
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(
      :title,
      :body,
      :book_id
    )
  end
end
