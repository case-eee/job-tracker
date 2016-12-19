class DashboardController < ApplicationController
 
def index
  @interested_jobs = Job.count_by_level_of_interest.sort.reverse.take(10)
  @company_interests = Company.average_interest_among_jobs
end

end