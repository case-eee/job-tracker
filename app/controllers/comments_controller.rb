class CommentsController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @comments = @job.comments
    render :index
  end
end
