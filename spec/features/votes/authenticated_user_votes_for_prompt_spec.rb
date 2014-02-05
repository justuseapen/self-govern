require 'spec_helper'

feature "signed in users can vote and unvote for prompts" do
  user = FactoryGirl.create(:user)
  scenario "authenticated user votes for prompt" do
    prompt = FactoryGirl.create(:prompt)
    visit root_path
    sign_in_as(user)
    click_button("up")
    expect(page).to have_content("You've successfully voted for")
  end
  scenario "authenticated user unvotes for prompt" do
    prompt = FactoryGirl.create(:prompt)
    visit root_path
    sign_in_as(user)
    click_button("down")
    expect(page).to have_content("You've removed your vote")
  end
  scenario "unauthenticated user attempts to vote for prompt" do
    visit root_path
    click_button("up")
    expect(page).to have_content("Please sign in to vote for prompts")
  end
end