class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:success] = "#{@tag.title} was successfully added!"
      redirect_to tag_path(@tag)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tag_path(@tag)
    else
      render :edit
    end
  end

  def destroy
    @tag.delete

    flash[:success] = "#{@tag.title} was successfully deleted!"
    redirect_to tags_path
  end


  private

  def tag_params
    params.require(:tag).permit(:title)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

end
