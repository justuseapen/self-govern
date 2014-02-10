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
      redirect_to prompt_path(@prompt), notice: 'Comment added!'
    else
      render template: "prompts/show", notice: 'Please enter a valid comment'
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
