require 'spec_helper'

feature "Registered user logs in", %q{
  As a registered user
  I want to log in
  So that I can use the app
} do

  # Acceptance Criteria:
  # * I must supply my email and password
  # * If my email or password is incorrect, I must re-enter it
  # * If my email and password are correct I am logged into the site

  let(:user) { FactoryGirl.create(:user) }

  context "provides correct account information" do
    it "logs into the app" do
      visit root_path

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_on 'Sign in'

      expect(page).to have_content("Signed in successfully.")
    end
  end

  context "provides invalid account information" do
    it "displays error if password is incorrect" do
      visit root_path

      fill_in "Email", with: user.email
      fill_in "Password", with: 'WR0NG'

      click_on "Sign in"

      expect(page).to have_content("Invalid email or password")
    end

    it "displays error if email is incorrect" do
      visit root_path

      fill_in "Email", with: "WR0NG"
      fill_in "Password", with: user.password

      click_on "Sign in"

      expect(page).to have_content("Invalid email or password")
    end
  end
end
