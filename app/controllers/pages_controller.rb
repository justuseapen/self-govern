class PagesController < ApplicationController
  def home
    @prompts = Prompt.where("not archive and not to_do")
  end

  def archives_index
    @prompts = Prompt.where("archive and not to_do")
  end

  def to_do_index
    @prompts = Prompt.all.where("to_do and not archive")
  end

  def analytics
    @count = User.select { |user| user.confirmed? }.count
  end
end
