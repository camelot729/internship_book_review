require "application_system_test_case"

class BookRatingsTest < ApplicationSystemTestCase
  setup do
    @book_rating = book_ratings(:one)
  end

  test "visiting the index" do
    visit book_ratings_url
    assert_selector "h1", text: "Book Ratings"
  end

  test "creating a Book rating" do
    visit book_ratings_url
    click_on "New Book Rating"

    fill_in "Book", with: @book_rating.book_id
    fill_in "Rating Value", with: @book_rating.rating_value
    click_on "Create Book rating"

    assert_text "Book rating was successfully created"
    click_on "Back"
  end

  test "updating a Book rating" do
    visit book_ratings_url
    click_on "Edit", match: :first

    fill_in "Book", with: @book_rating.book_id
    fill_in "Rating Value", with: @book_rating.rating_value
    click_on "Update Book rating"

    assert_text "Book rating was successfully updated"
    click_on "Back"
  end

  test "destroying a Book rating" do
    visit book_ratings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book rating was successfully destroyed"
  end
end
