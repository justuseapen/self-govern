require 'spec_helper'

feature "signed in users can vote and unvote for prompts" do
  let(:user) { FactoryGirl.create(:user) }

  context "authenticated user votes for prompt" do
    it "adds a vote to the prompt" do
      prompt = FactoryGirl.create(:prompt)
      visit prompt_path(prompt)
      sign_in_as(user)
      click_link("Vote")
      expect(page).to have_content("Unvote")
    end

    it "removes a vote from the prompt" do
      prompt = FactoryGirl.create(:prompt)
      visit prompt_path(prompt)
      sign_in_as(user)
      click_link("Vote")
      click_link("Unvote")
      expect(page).to have_content("Vote")
    end
  end

  context "unauthenticated user attempts to vote for prompt" do
    it "does not allow the user to vote" do
      visit root_path
      expect(page).to_not have_content("Vote")
      expect(page).to_not have_content("Unvote")
    end
  end
end
