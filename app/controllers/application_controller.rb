require 'csv'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  attr_reader :jobs, 
              :quotes,
              :jobs_by_location,
              :jobs_by_interest

  def dashboard
    @tags = Tag.all
    @locations = Job.pluck(:city).uniq
    @interest_levels = interest_range
    @company_interest = {}
    Company.all.each do |company|
      @company_interest[company.name] = company.jobs.average(:level_of_interest)
    end
    @companies_by_max_interest = @company_interest.max_by(3) {|k,v|v}
    generate_jobs
    generate_quote
  end

  private

  def generate_jobs 
    if params[:extra].nil?
      @jobs = Job.all
    else
      if params[:extra][:tag_ids]
        @selected_jobs = Tagging.where(tag_id:params[:extra][:tag_ids]).pluck(:job_id)
        @jobs = Job.find(@selected_jobs)
      elsif params[:extra][:location]
        @jobs = Job.where(city: params[:extra][:location])
      elsif params[:extra][:interest]
        if params[:extra][:interest][0,3] == "101"
          @jobs = Job.where(:level_of_interest => 101..150)      
        else 
          range = params[:extra][:interest].split("-")
          @jobs = Job.where(:level_of_interest => range[0]..range[1])
        end
      end
    end
    @jobs = Job.all if @jobs.nil?
  end

  def interest_range 
    arr = (1..100).step(10).map {|x| "#{x}-#{x+9}"}
    arr << "101+"
  end

  def generate_quote
    @quotes = []
    CSV.foreach(Rails.root.join('app/assets/quotes.csv'), :headers=> true) do |row|
      @quotes << row[0]
    end
  end
end
