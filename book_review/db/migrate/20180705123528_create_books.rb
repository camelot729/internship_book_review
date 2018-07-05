class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :review
      t.integer :book_rating
      t.integer :review_rating
      t.date :publication_time

      t.timestamps
    end
  end
end
