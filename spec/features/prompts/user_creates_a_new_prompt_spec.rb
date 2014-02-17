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

  context "user supplies text for mutable prompt" do
    it "creates a new prompt" do
      visit root_path

      click_on "Add prompt"

      fill_in "Text", with: "Should the background be pink?"

      click_on "Create Prompt"

      expect(page).to have_content("Your prompt was successfully added")
      expect(page).to have_content("Should the background be pink?")
    end
    it "creates an immutable prompt" do
      visit new_prompt_path
      fill_in "Text", with: "Should we make babies?"
      check ("Immutable")
      click_on "Create Prompt"
      expect(page).to have_content("Should we make babies? [IMMUTABLE]")
    end
  end

  context "user supplies no text" do
    it "gives an error" do
      visit root_path
      click_on "Add prompt"

      click_on "Create Prompt"

      expect(page).to have_content("Text can't be blank")
    end
  end
end
