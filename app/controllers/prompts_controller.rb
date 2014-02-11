class PromptsController < ApplicationController
  before_filter :curator?, only: [:destroy]
  before_filter :archived?, only:[:vote,:unvote]

  def new
    @prompt = Prompt.new
  end

  def create
    @prompt = current_user.prompts.build(prompt_params)

    if @prompt.save
      flash[:success] = 'Your prompt was successfully added!'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prompt = Prompt.find(params[:id])
    @choices = (@prompt.choices.sort_by!{|choice|Vote.where("votable_type = 'Choice' AND votable_id = #{choice.id}").size}).reverse!
    @choice = Choice.new
    @comments = @prompt.comments
    @comment = Comment.new
  end

  def archive
    @prompt = Prompt.find(params[:prompt_id])
    @prompt.make_archive
    if @prompt.save
      flash[:success] = 'The prompt was successfully archived!'
      redirect_to prompt_path(@prompt)
    else
      flash[:alert] = "The prompt couldn't be archived! Please try again!"
      redirect_to prompt_path(@prompt)
    end
  end

  def archives_index
    # @prompts = Prompt.all.where(archived == true)
  end

  def destroy
    Prompt.find(params[:id]).destroy
    flash[:notice] = 'The prompt was successfully deleted!'
    redirect_to root_path
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
  def curator?
    current_user.curator?
  end
  def archived?
    Prompt.find(params[:prompt_id]).archive == true
  end
end
