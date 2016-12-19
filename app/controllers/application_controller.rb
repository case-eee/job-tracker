class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def build_cities
    Job.all.order(:city).pluck(:city).uniq
  end

  def build_jobs_by_city
    cities = build_cities

    jobs_by_city = {}
    cities.each do |city|
      jobs_by_city[city] = Job.where(city: city)
    end
    jobs_by_city
  end

  def build_interests
    Job.all.order(level_of_interest: :desc).pluck(:level_of_interest).uniq
  end

  def build_jobs_by_level_of_interest
    interest_levels = build_interests

    jobs_by_level_of_interest = {}
    interest_levels.each do |interest_level|
      jobs_by_level_of_interest[interest_level] = Job.where(level_of_interest: interest_level)
    end
    jobs_by_level_of_interest
  end

  def average_level_of_interest(company)
    company.jobs.average(:level_of_interest)
  end

  def threshold(top_x)
    companies = Company.all
    avg_interest_levels = companies.map do |company|
      average_level_of_interest(company)
    end
    avg_interest_levels.sort.reverse[0,top_x].last.to_f
  end

  def build_top_companies(top_x = 3)
    interest_threshold = threshold(top_x)

    companies = Company.all
    avg_interest_levels_by_company = {}
    companies.each do |company|
      avg_interest_levels_by_company[company] = average_level_of_interest(company)
    end
    top_companies = avg_interest_levels_by_company.select{|key,value| value > interest_threshold}.keys
  end


end
