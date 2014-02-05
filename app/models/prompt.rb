class Prompt < ActiveRecord::Base
  validates_presence_of :text

  belongs_to :user
end
