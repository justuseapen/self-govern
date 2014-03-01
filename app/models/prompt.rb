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

  def make_archive
    self.to_do = false
    self.archive = true
    self.save
  end

  def make_to_do
    self.to_do = true
    self.save
  end

  def display_text
    "#{self.text} #{'[IMMUTABLE]' unless self.immutable.blank?}"
  end

  def is_deletable?
    difference = (Time.now - 2592000)
    (self.created_at < difference) && (self.votes.count == 0)
  end

end
