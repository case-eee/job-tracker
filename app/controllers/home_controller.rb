class HomeController < ApplicationController
  def index
    render :index
  end

  def show
    @jobs = Job.where(level_of_interest: params[:id])
    if @jobs.empty?
      redirect_to companies_path
    else
      render :show
    end
  end
end
