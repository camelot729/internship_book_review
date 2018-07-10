require 'test_helper'

class BookRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_rating = book_ratings(:one)
  end

  test "should get index" do
    get book_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_book_rating_url
    assert_response :success
  end

  test "should create book_rating" do
    assert_difference('BookRating.count') do
      post book_ratings_url, params: { book_rating: { book_id: @book_rating.book_id, rating_value: @book_rating.rating_value } }
    end

    assert_redirected_to book_rating_url(BookRating.last)
  end

  test "should show book_rating" do
    get book_rating_url(@book_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_rating_url(@book_rating)
    assert_response :success
  end

  test "should update book_rating" do
    patch book_rating_url(@book_rating), params: { book_rating: { book_id: @book_rating.book_id, rating_value: @book_rating.rating_value } }
    assert_redirected_to book_rating_url(@book_rating)
  end

  test "should destroy book_rating" do
    assert_difference('BookRating.count', -1) do
      delete book_rating_url(@book_rating)
    end

    assert_redirected_to book_ratings_url
  end
end
