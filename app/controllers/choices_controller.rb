class ChoicesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create] # , :show

  def index
    @choice = Choice.new
  end

  def show
    @choice = Choice.find(params[:id])
  end

  def create
    @prompt = Prompt.find(params[:prompt_id])
    @choice = @prompt.choices.build(choice_params)
    @choice.user = current_user
    if @choice.save
      redirect_to prompt_path(@prompt), notice: 'Choice added!'
    else
      render template: "prompts/show", notice: 'Please enter a valid choice'
    end
  end

  protected
  def choice_params
    params.require(:choice).permit(:text)
  end
end
