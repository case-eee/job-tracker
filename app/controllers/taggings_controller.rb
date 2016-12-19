class TaggingsController < ApplicationController
  def new
    Tagging.create(tag_id: params[:extra][:tag_id], job_id: params[:extra][:job_id])
    redirect_to company_job_path(params[:extra][:company_id], params[:extra][:job_id])
  end

  def destroy
    tagging = Tagging.find_by(tag_id:params[:extra][:tag_id], job_id: params[:extra][:job_id])
    tagging.destroy
    redirect_to company_job_path(params[:extra][:company_id], params[:extra][:job_id])
  end

  private

  def taggings_params
    params.require(:taggings).permit(:tag_id, :job_id)
  end
end
