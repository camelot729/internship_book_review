require 'rails_helper'

feature "User want create a post" do
  let(:user) { create(:user) }
  let(:user1) do
    create :user, email: "zxczxc@zxczxczxc.zxczcx", password: "qweqwe"
  end
  let!(:book) do
    create :book, user: user
  end

  scenario "user on page with all book review and create a book with valid credentials" do
    sign_in(user)
    create_book
    # expect(book.user).to eq user
    save_and_open_page
    within ('.book') do
      click_link_or_button "Edit"
    end
    fill_in 'book_title', with: "Kamil"
    fill_in 'book_review', with: "the best"
    click_on "Сохранить Book"
    expect(page).to have_content "Title"
  end

  scenario "user on page with all book review and open a book, which created
   another user and try change info of review" do
    sign_in(user1)
    click_on "Books"
    save_and_open_page
    within(".book") do
      click_on "Show"
    end
    within(".book") do
      expect(page).not_to have_content "Edit"
    end
  end

  def sign_in(user)
    visit new_user_session_path
    expect(page).to have_content "Log in"
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button "Log in"
  end

  def create_book
    visit books_path

    click_on "New Book"
    fill_in 'book_title', with: book.id
    fill_in 'book_review', with: book.id
    click_on "Создать Book"
    p book.user.email
  end

end
