require "rails_helper"

feature "User want create a post" do
  let!(:user) { create(:user) }
  context "when book creator signed in" do
    before { sign_in(user) }

    scenario "user on page with all book review
    and create a book with valid credentials" do
      visit books_path

      click_on "New Book"

      fill_in "book_title", with: "Test title"
      fill_in "book_review", with:"Test review"
      click_on "Создать Book"
      expect(page).to have_content "Overrall rating"
    end

    scenario "user on page with all book review
     and create a book with valid credentials" do
      visit books_path

      click_on "New Book"

      fill_in "book_title", with: ""
      fill_in "book_review", with:"Test review"
      click_on "Создать Book"
      expect(page).to have_content "Back"
    end
  end
  def sign_in(user)
    visit new_user_session_path
    expect(page).to have_content "Log in"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
  end

end
