class AddConstraintToBookRatings < ActiveRecord::Migration[5.2]
  def up
    execute 'ALTER TABLE book_ratings ADD CONSTRAINT rating_value_range
    CHECK(rating_value >= 0 and rating_value <= 10)'
  end

  def down
    execute 'ALTER TABLE book_ratings DROP CONSTRAINT rating_value_range'
  end
end
