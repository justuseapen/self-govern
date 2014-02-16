require 'spec_helper'

feature "only one choice can be voted on per prompt" do
  context "user votes for choice on prompt" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:prompt) { FactoryGirl.create(:prompt) }
    let!(:choice) { FactoryGirl.create(:choice,prompt: prompt) }
    let!(:choice2) { FactoryGirl.create(:choice,prompt: prompt) }
    
    before :each do
      sign_in_as(user)
      visit prompt_path(prompt)
      page.all(:link,"Vote")[0].click
    end
    
    it "cannot vote for second choice" do
      click_link("Vote")
      expect(page).to have_content("Vote")
    end
  end
end