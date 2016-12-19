require 'CSV'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  attr_reader :jobs, 
              :jobs_by_location,
              :quotes

  def dashboard
    generate_params
    generate_quotes
    @tags = Tag.all
    @locations = Job.pluck(:city).uniq
    @jobs_not_by_location = Job.group(:city).count
    @company_interest = {}
    Company.all.each do |company|
      @company_interest[company.name] = company.jobs.average(:level_of_interest)
    end
    @jobs_by_interest = Job.group(:level_of_interest).count
    @companies_by_max_interest = @company_interest.max_by(3) {|k,v|v}
  end

  private

  def generate_params
    if params[:extra].nil?
      @jobs = Job.all
    elsif params[:extra][:tag_ids]
      @selected_jobs = Tagging.where(tag_id:params[:extra][:tag_ids]).pluck(:job_id)
      @jobs = Job.find(@selected_jobs)
    elsif params[:extra][:location]
      @jobs_by_location = Job.where(city: params[:extra][:location])
      @jobs = Job.all
    end
  end

  def generate_quotes
    @quotes = []
    CSV.foreach(Rails.root.join('app/assets/quotes.csv'), :headers=> true) do |row|
      @quotes << row[0]
    end
  end
end
