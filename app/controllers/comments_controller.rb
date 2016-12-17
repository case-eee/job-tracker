class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.find(params[:comment_params])
    
  end

  private

  def comment_params
    params.require(:comment).permiat(:content)
  end
end
