require 'spec_helper'

feature "signed in users can vote and unvote for prompts" do
  let(:user) { FactoryGirl.create(:user) }

  context "authenticated user votes for prompt" do
    it "adds a vote to the prompt" do
      prompt = FactoryGirl.create(:prompt)
      visit prompt_path(prompt)
      sign_in_as(user)

      click_button("up")
      expect(page).to have_content("You've successfully voted for")
    end

    it "removes a vote from the prompt" do
      prompt = FactoryGirl.create(:prompt)
      visit prompt_path(prompt)
      sign_in_as(user)
      click_button("down")
      expect(page).to have_content("You've removed your vote")
    end
  end

  context "unauthenticated user attempts to vote for prompt" do
    it "does not allow the user to vote" do
      visit root_path
      click_button("up")
      expect(page).to have_content("Please sign in to vote for prompts")
    end
  end
end
