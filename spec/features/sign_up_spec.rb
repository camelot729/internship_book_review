require 'rails_helper'

feature "As guest I want to sign up new account" do
  let!(:user) { create(:user) }
  scenario "guest sign up with valid credentials" do
    visit new_user_registration_path

    expect(page).to have_content "Sign up"

    fill_in 'user_first_name', with: "Kamil"
    fill_in 'user_last_name', with:"Khadeev"
    fill_in 'user_email', with: "user1@example.com"
    fill_in 'user_password', with: "123456"
    fill_in 'user_password_confirmation', with: "123456"

    click_button "Sign up"
    expect(page).to have_content "Log out"
  end

  scenario "guest sign up with invalid credentials" do
    visit new_user_registration_path

    expect(page).to have_content "Sign up"

    fill_in 'user_first_name', with: "Kamil"
    fill_in 'user_last_name', with:"Khadeev"
    fill_in 'user_email', with: "user1@example.com"
    fill_in 'user_password', with: "123456"
    fill_in 'user_password_confirmation', with: "1223456"

    click_button "Sign up"
    expect(page).to have_content "Sign up"
  end

end
