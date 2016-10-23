module HomepageHelper
  def breakdown_jobs_by_level_of_interest
    @jobs_by_interest = Job.breakdown_by_level_of_interest
  end

  def display_top_three
    @rankings = Company.top_three_by_level_of_interest
  end

  def breakdowns_jobs_by_location
    @jobs_by_location = Company.breakdown_by_location
  end

  def city_url(breakdown)
    "/companies?location=#{breakdown.split(":")[0]}"
  end
end
