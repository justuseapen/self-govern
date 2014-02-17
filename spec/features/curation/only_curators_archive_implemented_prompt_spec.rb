require "spec_helper"

feature "archiving prompts" do
  context "curator archived immutable prompt" do
    let(:curator) { FactoryGirl.create(:curator) }
    let!(:prompt) { FactoryGirl.create(:prompt, immutable: true) }
    let!(:choice) { FactoryGirl.create(:choice,prompt: prompt) }
    before :each do
      sign_in_as curator
      visit prompt_path(prompt)
      click_link "Archive Prompt"
    end
    it "should retain immutable status into archive" do
      visit prompt_path(prompt)
      expect(page).to have_content("IMMUTABLE")
    end
    
  end
  context "curator archives implemented prompt" do
    let(:curator) { FactoryGirl.create(:curator) }
    let!(:prompt) { FactoryGirl.create(:prompt) }
    let!(:choice) { FactoryGirl.create(:choice,prompt: prompt) }

    before :each do
      sign_in_as curator
      visit prompt_path(prompt)
      click_link "Archive Prompt"
    end

    it "should archive prompt" do
      visit prompt_path(prompt)
      expect(page).to have_content("Archived")
    end
    it "should not let anyone add/remove votes" do
      visit prompt_path(prompt)
      expect(page).to_not have_content("Vote")
    end
    it "should not let anyone add choices" do
      visit prompt_path(prompt)
      expect(page).to_not have_content("Add New Choice")
    end
    it "should not let people comment" do
      visit prompt_path(prompt)
      expect(page).to_not have_content("Submit")
    end
  end

end