module JobHelper
  extend self

  def get_params(params)
    company = Company.find(params[:company_id]) if params[:company_id]

    if params[:sort] == "interest"
      jobs = Job.all.order(level_of_interest: :desc)
    elsif params[:company_id].nil?
        jobs = Job.all
    else
      jobs = company.jobs
    end
    [company, jobs]
  end

end
