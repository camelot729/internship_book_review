require "application_system_test_case"

class ReviewCommentsTest < ApplicationSystemTestCase
  setup do
    @review_comment = review_comments(:one)
  end

  test "visiting the index" do
    visit review_comments_url
    assert_selector "h1", text: "Review Comments"
  end

  test "creating a Review comment" do
    visit review_comments_url
    click_on "New Review Comment"

    fill_in "Body", with: @review_comment.body
    fill_in "Book", with: @review_comment.book_id
    fill_in "Title", with: @review_comment.title
    click_on "Create Review comment"

    assert_text "Review comment was successfully created"
    click_on "Back"
  end

  test "updating a Review comment" do
    visit review_comments_url
    click_on "Edit", match: :first

    fill_in "Body", with: @review_comment.body
    fill_in "Book", with: @review_comment.book_id
    fill_in "Title", with: @review_comment.title
    click_on "Update Review comment"

    assert_text "Review comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Review comment" do
    visit review_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review comment was successfully destroyed"
  end
end
