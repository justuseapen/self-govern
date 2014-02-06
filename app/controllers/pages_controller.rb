class PagesController < ApplicationController
  def home
    @prompts = Prompt.all
  end
end
