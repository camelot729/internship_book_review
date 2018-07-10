class CreateBookRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :book_ratings do |t|
      t.integer :rating_value
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
