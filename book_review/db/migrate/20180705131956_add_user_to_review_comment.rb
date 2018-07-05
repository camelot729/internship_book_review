class AddUserToReviewComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :review_comments, :user, foreign_key: true
  end
end
