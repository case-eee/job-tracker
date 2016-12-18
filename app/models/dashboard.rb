class Dashboard
  def job_count_by_interest(interest_level)
    Job.where(level_of_interest: interest_level).count
  end

  def average_interest_for_company(company)
    company.jobs.average(:level_of_interest)
  end

  def job_count_by_location(location)
    Job.where(city: location).count
  end
end
