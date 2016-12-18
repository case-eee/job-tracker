class Dashboard
  def job_count_by_interest(interest_level)
    Job.where(level_of_interest: interest_level).count
  end

  def top_three_companies_by_interest_level
    sorted = Company.all.sort_by do |company|
      company.average_interest
    end.reverse
    sorted[0..2]
  end

  def job_locations
    Job.distinct.pluck(:city).sort
  end

  def job_count_by_location(location)
    Job.where(city: location).count
  end

  def job_interest_levels
    Job.distinct.pluck(:level_of_interest).sort
  end

  def job_count_by_interest_level(interest_level)
    Job.where(level_of_interest: interest_level).count
  end
end
