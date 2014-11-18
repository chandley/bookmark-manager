require 'spec_helper'
require_relative '../../lib/user'


feature "User signs up" do

  scenario "When being logged out" do
    expect(lambda { sign_up }).to change( User, :count).by(1)
    sign_up
    expect(page).to have_content("Welcome, alice@example.com")
    expect(User.first.email).to eq("alice@example.com")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('a@a.com', 'pass', 'wrong')}.to change(User, :count).by(0)
  end

  def sign_up(email = "alice@example.com",
              password = "oranges!",
              password_confirmation = "oranges!")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end
end