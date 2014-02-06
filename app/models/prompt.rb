class Prompt < ActiveRecord::Base
  validates_presence_of :text
  has_many :choices

  belongs_to :user
end
