class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :archived?, only: [:create]

  def index
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @prompt = Prompt.find(params[:prompt_id])
    @comment = @prompt.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Comment added!'
      redirect_to prompt_path(@prompt)
    else
      flash[:alert] = 'Please enter a valid comment'
      render template: "prompts/show"
    end
  end

  protected
  def comment_params
    params.require(:comment).permit(:text)
  end
  def archived?
    Prompt.find(params[:prompt_id]).archive == true
  end
end
