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

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.update(params[:id], tag_params)
    redirect_to tag_path(@tag)
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.delete
    flash[:success] = "#{@tag.title} tag was successfully deleted!"
    redirect_to tags_path
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "You created a #{@tag.title} tag"
      redirect_to tag_path(@tag)
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
