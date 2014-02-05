class ChoicesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create] # , :show

  def index
    @choice = Choice.new
  end

  def show
    @choice = Choice.find(params[:id])
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
      flash[:notice] = 'Choice added!'
      redirect_to root_path
    else
      flash[:notice] = 'Please enter a valid choice'
    end
  end

  protected
  def choice_params
    params.require(:choice).permit(:text, :prompt_id, :user_id)
  end
end
