require "rails_helper"

feature "User want create a post" do
  let(:user) { create(:user) }
  let(:user1) { create(:user) }
  let!(:book) do
    create :book, user: user
  end

  context "when book creator signed in" do
    before {
      sign_in(user)
    }

    scenario "user on page with all book review
    and destroy a book which he created" do
      click_on "Books"
      within(".book") do
        click_on "Show"
      end
      within(".book") do
        click_on "Destroy"
      end
      expect(page).to have_no_content "Show"
    end
  end

  context "when other user sighed in" do
    before { sign_in(user1) }

    scenario "user on page with all book review
    and want destroy a book which he not created" do
      sign_in(user1)
      click_on "Books"
      within(".book") do
        click_on "Show"
      end
      within(".book") do
        expect(page).to have_no_content "Destroy"
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

end
