require 'rails_helper'

feature "User want create a post" do
  let(:user) { create(:user) }
  let(:user1) do
    create :user, email: "zxczxc@zxczxczxc.zxczcx", password: "qweqwe"
  end
  let!(:book) do
    create :book, user: user
  end

  scenario "user on page with all book review
  and destroy a book which he created" do
    sign_in(user)
    click_on "Books"
    within(".book") do
      click_on "Show"
    end
    within(".book") do
      click_on "Destroy"
    end
    expect(page).to have_no_content "Show"
  end

  scenario "user on page with all book review
  and destroy a book which he created" do
    sign_in(user1)
    click_on "Books"
    within(".book") do
      click_on "Show"
    end
    within(".book") do
      expect(page).to have_no_content "Destroy"
    end
  end

  def sign_in(user)
    visit new_user_session_path
    expect(page).to have_content "Log in"
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button "Log in"
  end

end
