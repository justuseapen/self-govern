require 'spec_helper'

feature "User adds a comment to a prompt", %q{
  As a registered user
  I want to comment on a prompt
  So that I can discuss it with others
} do

  # Acceptance Criteria:
  # * I can enter text for a comment
  # * If I supply text it is displayed to all users
  # * If I don't supply text, I get an error

  let(:user) { FactoryGirl.create(:user) }
  let!(:prompt) { FactoryGirl.create(:prompt) }

  context "authorized user adds a comment" do
    before :each do
      sign_in_as(user)
    end

    it "adds a valid comment" do
      visit prompt_path(prompt)

      fill_in "Comment", with: "This be a comment!"
      click_on "Submit"

      expect(page).to have_content("Comment added!")
    end

    it "displays all comments" do
      comment = FactoryGirl.create( :comment, prompt: prompt, user: user )
      visit prompt_path(prompt)

      expect(page).to have_content(comment.text)
    end
  end

  context "unauthorized user views comments" do
    it "does not allow new comments" do
      visit prompt_path(prompt)

      expect(page).to_not have_content("Submit")
    end

    it "diplays existing comments" do
      comment = FactoryGirl.create( :comment, prompt: prompt, user: user )
      visit prompt_path(prompt)

      expect(page).to_not have_content(comment.text)
    end
  end
end
