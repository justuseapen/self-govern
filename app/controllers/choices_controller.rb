class ChoicesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @choice = Choice.new
  end  
      
  def vote
    @choice = Choice.find(params[:choice_id])
    if user_already_voted?
      redirect_to prompt_path(@choice.prompt), notice: "You may only vote for one choice per prompt"
    else
      vote = Vote.new(voter_type: "User", voter_id: current_user.id,
                    votable_type: "Choice", votable_id: @choice.id)
      vote.save
      redirect_to prompt_path(@choice.prompt)
    end
  end

  def unvote
    @choice = Choice.find(params[:choice_id])
    Vote.where(voter_type: "User", voter_id: current_user.id,
               votable_type: "Choice", votable_id: @choice.id).first.destroy
    redirect_to prompt_path(@choice.prompt)
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
  def archived?
    Prompt.find(params[:prompt_id]).archive == true
  end
  def user_already_voted?
    @choice.prompt.choices.each do |choice|
      if current_user.voted_for?(choice)
        true
      end
    end
  end
  
end
