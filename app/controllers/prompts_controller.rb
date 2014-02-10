class PromptsController < ApplicationController
  def new
    @prompt = Prompt.new
  end

  def create
    @prompt = current_user.prompts.build(prompt_params)

    if @prompt.save
      redirect_to root_path, notice: 'Your prompt was successfully added'
    else
      render :new
    end
  end

  def show
    @prompt = Prompt.find(params[:id])
    @choices = (@prompt.choices.sort_by!{|choice|Vote.where("votable_type = 'Choice' AND votable_id = #{choice.id}").size}).reverse!
    @choice = Choice.new
  end

  def vote
    @prompt = Prompt.find(params[:prompt_id])
    @prompt.liked_by current_user
    redirect_to root_path
  end

  def unvote
    @prompt = Prompt.find(params[:prompt_id])
    @prompt.unliked_by current_user
    redirect_to root_path
  end

  private

  def prompt_params
    params.require(:prompt).permit(:text)
  end
end
