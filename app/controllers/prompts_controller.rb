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
    @choices = @prompt.choices
    @choice = Choice.new
  end

  private

  def prompt_params
    params.require(:prompt).permit(:text)
  end
end
