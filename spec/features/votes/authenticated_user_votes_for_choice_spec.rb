require 'spec_helper'

feature "signed in users can vote and unvote for choices" do
  user = FactoryGirl.create(:user)
  scenario "authenticated user votes for choice" do
    prompt = FactoryGirl.create(:prompt)
    choice = FactoryGirl.create(:choice, prompt: prompt)
    visit root_path
    sign_in_as(user)
    click_button(choice)
    expect(page).to have_content("You've successfully voted for")
  end
  scenario "authenticated user unvotes for choice" do
    prompt = FactoryGirl.create(:prompt)
    choice = FactoryGirl.create(:choice, prompt: prompt)
    visit root_path
    sign_in_as(user)
    click_button(choice)
    click_button(choice)
    expect(page).to have_content("You've removed your vote")
  end
  scenario "unauthenticated user attempts to vote for choice" do
    prompt = FactoryGirl.create(:prompt)
    choice = FactoryGirl.create(:choice, prompt: prompt)
    visit root_path
    click_button(choice)
    expect(page).to have_content("Please sign in")
  end
end