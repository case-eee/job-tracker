class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # def index
  #   @comments = Comment.all
  # end
  #
  # def new
  #   @comment = Comment.new
  # end

  # def create
  #   @comment = Comment.create(comment_params)
  #   if @comment.save
  #     redirect_to comment_path(@comment)
  #   else
  #     render :new
  #   end
  # end

  def create
  @comment = Comment.new(comment_params)
  @comment.job_id = params[:job_id]

  @comment.save

   redirect_to company_job_path(@comment.job.company, @comment.job)
end



  def show
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params

    params.require(:comment).permit(:content, :job_id)
  end
end
