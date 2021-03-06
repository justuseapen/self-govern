class Choice < ActiveRecord::Base
  acts_as_votable

  validates_presence_of :text
  validates_presence_of :prompt_id
  validates_presence_of :user_id

  belongs_to :prompt,
    inverse_of: :choices
  belongs_to :user,
    inverse_of: :choices

  def vote_count
    self.votes.size
  end
end
