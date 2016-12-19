class JobsController < ApplicationController

  def index
    @jobs = Job.where(nil)
    @jobs = @jobs.location(params[:location]) if params[:location].present?
    @jobs = @jobs.interest(params[:interest]) if params[:interest].present?
  end

end
