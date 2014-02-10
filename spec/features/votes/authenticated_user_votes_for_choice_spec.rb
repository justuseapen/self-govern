require 'spec_helper'

feature "signed in users can vote and unvote for choices" do
  let(:user) { FactoryGirl.create(:user) }

  scenario "authenticated user votes for choice" do
    prompt = FactoryGirl.create(:prompt)
    choice = FactoryGirl.create(:choice, prompt: prompt)
    visit prompt_path(prompt)
    sign_in_as(user)
    click_link("Vote")
    expect(page).to have_content("Unvote")
  end
  scenario "authenticated user unvotes for choice" do
    prompt = FactoryGirl.create(:prompt)
    choice = FactoryGirl.create(:choice, prompt: prompt)
    sign_in_as(user)
    visit prompt_path(prompt)
    click_link("Vote")
    click_link("Unvote")

    expect(page).to have_content("Vote")
  end
  scenario "unauthenticated user attempts to vote for choice" do
    prompt = FactoryGirl.create(:prompt)
    choice = FactoryGirl.create(:choice, prompt: prompt)
    visit prompt_path(prompt)
    expect(page).to_not have_content("Vote")
  end
end
