require 'spec_helper'

feature "user adds a choice", %Q{
  As an authenticated user
  I want to add a choice
  So people can vote
  } do
  # Acceptance Criteria:
  # * I must supply text for choice
  # * If there is no text, I get an error
  # * If there is text, the choice is created for others to see

  let(:user) { FactoryGirl.create(:user) }
  let(:prompt) { FactoryGirl.create(:prompt) }

  before :each do
    sign_in_as(user)
  end

  scenario "authenticated user adds a choice" do
    visit root_path
    click_on prompt
    click_on "Add New Choice"
    fill_in "Choice", with: 'Pizza'
    click_on "Add Choice"

    expect(page).to have_content("Your choice was successfully added")
    expect(page).to_not have_content("can't be blank")
  end

  scenario "authenticated user leaves the add choice box blank" do
    visit root_path
    click_on prompt
    click_on "Add New Choice"
    click_on "Add Choice"

    expect(page).to_not have_content("Your choice was successfully added")
    expect(page).to have_content("can't be blank")
  end

  scenario "unauthenticated user tries to add a choice" do
    visit root_path
    click_on prompt
    click_on "Add New Choice"

    expect(page).to_not have_content("Your choice was successfully added")
    expect(page).to have_content("You must be signed in")
  end
end
