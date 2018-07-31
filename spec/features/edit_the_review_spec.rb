require "rails_helper"

feature "User want create a post" do
  let(:user) { create(:user) }
  let(:user1) { create(:user) }
  let!(:book) do
    create :book, user: user
  end
  context "when book creator signed in" do
    before {sign_in(user)}

    scenario "user on page with all book review and create a book with valid credentials" do
      create_book
      within (".book") do
        click_link_or_button "Edit"
      end
      fill_in "book_title", with: "Kamil"
      fill_in "book_review", with: "the best"
      click_on "Сохранить Book"
      expect(page).to have_content "Title"
    end
  end

  context "when other user sighed in" do
    before { sign_in(user1) }

    scenario "user on page with all book review and open a book, which created
     another user and try change info of review" do
      click_on "Books"

      within(".book") do
        click_on "Show"
        expect(page).not_to have_content "Edit"
      end
    end
  end

  def sign_in(user)
    visit new_user_session_path
    expect(page).to have_content "Log in"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
  end

  def create_book
    visit books_path
    click_on "New Book"
    fill_in "book_title", with: book.id
    fill_in "book_review", with: book.id
    click_on "Создать Book"
  end

end
