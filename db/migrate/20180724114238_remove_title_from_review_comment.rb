class RemoveTitleFromReviewComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :review_comments, :title, :string
  end
end
