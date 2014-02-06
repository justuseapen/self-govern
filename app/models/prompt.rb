class Prompt < ActiveRecord::Base
  acts_as_votable

  validates_presence_of :text

  has_many :choices

  belongs_to :user
end
