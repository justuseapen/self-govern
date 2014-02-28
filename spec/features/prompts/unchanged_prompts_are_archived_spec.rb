require "spec_helper"

feature "unchanged prompts are archived after 30 days" do
  context "prompt recieves no votes, no choices, no choice votes for thirty days" do
    let!(:prompt) { FactoryGirl.create(:prompt, created_at:  ) }
    it "archives prompt automatically" do
    end
  end
end