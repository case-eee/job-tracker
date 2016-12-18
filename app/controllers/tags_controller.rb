class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tag_path(@tag)
      flash[:success] = "You created a #{@tag.title} tag"
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
