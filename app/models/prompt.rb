class Prompt < ActiveRecord::Base
  acts_as_votable

  validates_presence_of :text

  has_many :choices,
    inverse_of: :prompt,
    dependent: :destroy

  has_many :comments,
    inverse_of: :prompt,
    dependent: :destroy

  belongs_to :user,
    inverse_of: :prompts

  def vote_count
    self.votes.size
  end

  def self.ordered_index_by_popularity
    Prompt.all.sort_by(&:vote_count).reverse!
  end
end
