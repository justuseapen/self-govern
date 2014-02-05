require 'spec_helper'

feature "User creates a new prompt", %q{
  As a registered user
  I want to create a prompt
  So that others can see and vote on it
} do

  # Acceptance Criteria:
  # * I must supply text for the prompt
  # * If there is no text, I get an error
  # * If there is text, the prompt is created for others to see

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as(user)
  end

  context "user supplies text" do
    it "creates a new prompt" do
      visit root_path
      click_on "Add prompt"

      fill_in "Prompt text", with: "Should the background be pink?"

      click_on "Create prompt"

      expect(page).to have_content("Your prompt was successfully added")
    end
  end

  context "user supplies no text" do
    it "gives an error" do
      visit root_path
      click_on "Add prompt"

      click_on "Create prompt"

      expect(page).to have_content("Your prompt must have text")
    end
  end
end
