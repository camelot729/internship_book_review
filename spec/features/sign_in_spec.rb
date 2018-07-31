require "rails_helper"

feature "As guest I want to sign in to my account" do
  let!(:user) { create(:user) }
  scenario "guest signs in with valid credentials" do
    visit new_user_session_path

    expect(page).to have_content "Log in"

    fill_in "user_email", with: "user@example.com"
    fill_in "user_password", with: "123456"

    click_button "Log in"
    expect(page).to have_content "Log out"
  end

  scenario "guest sings in with invalid credantials" do
    visit new_user_session_path

    expect(page).to have_content "Log in"

    fill_in "user_email", with: "user@example.com"
    fill_in "user_password", with: "12345"

    click_button "Log in"
    expect(page).to have_content "Log in"
  end

end
