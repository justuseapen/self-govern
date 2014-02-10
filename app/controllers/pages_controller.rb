class PagesController < ApplicationController
  def home
    @prompts = Prompt.where("not archive")
  end
  def archives_index
    @prompts = Prompt.where("archive")
  end
end
