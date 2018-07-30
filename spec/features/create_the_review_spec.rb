require 'rails_helper'

feature "User want create a post" do
  let!(:user) { create(:user) }
  scenario "user on page with all book review and create a book with valid credentials" do

    sign_in(user)

    visit books_path

    expect(page).to have_content "New Book"

    click_on "New Book"

    fill_in 'book_title', with: "Test title"
    fill_in 'book_review', with:"Test review"
    # save_and_open_page
    # save_and_open_screenshot
    click_on "Создать Book"
    expect(page).to have_content "Overrall rating"
  end

  scenario "user on page with all book review and create a book with valid credentials" do

    sign_in(user)

    visit books_path

    expect(page).to have_content "New Book"

    click_on "New Book"

    fill_in 'book_title', with: ""
    fill_in 'book_review', with:"Test review"
    # save_and_open_page
    # save_and_open_screenshot
    click_on "Создать Book"
    expect(page).to have_content "Back"
  end

  def sign_in(user)
    visit new_user_session_path
    expect(page).to have_content "Log in"
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button "Log in"
  end

end
