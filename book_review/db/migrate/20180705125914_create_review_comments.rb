class CreateReviewComments < ActiveRecord::Migration[5.2]
  def change
    create_table :review_comments do |t|
      t.string :title
      t.string :body
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
