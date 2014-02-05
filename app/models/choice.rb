class Choice < ActiveRecord::Base
  validates_presence_of :text
  validates_presence_of :prompt_id
  validates_presence_of :user_id

  belongs_to :prompt
  belongs_to :user
  has_many :votes
end
