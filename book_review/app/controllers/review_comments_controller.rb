class ReviewCommentsController < ApplicationController
  expose :review_comments
  expose :review_comment
  expose :book

  def create

    review_comment = book.review_comments.create(review_comment_params)
    review_comment.user = current_user

    if review_comment.save
      redirect_to book, notice: 'Review comment was successfully created.'
    else
      render :new
    end
  end


  def update

    if review_comment.update(review_comment_params)
      redirect_to book_path(review_comment.book), notice: 'Review comment was successfully updated.'
    else
      render :edit
    end
  end


  def destroy

    review_comment = book.review_comments.find(params[:id])
    review_comment.destroy
    redirect_to book, notice: 'Review comment was successfully destroyed.'
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:title, :body, :book_id)
  end
end
