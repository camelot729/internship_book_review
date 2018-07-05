json.extract! book, :id, :title, :review, :book_rating, :review_rating, :publication_time, :created_at, :updated_at
json.url book_url(book, format: :json)
