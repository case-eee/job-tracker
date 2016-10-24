class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.sort_by_city
    order(:city)
  end

  def self.top_three_by_level_of_interest
    format_results(extract_top_three)
  end

  def self.breakdown_by_location
    format_results(joins(:jobs).group(:city).count(:jobs))
  end

  private

  def self.sort_companies_by_jobs_interest
    joins(:jobs).group(:name).order("AVG(jobs.level_of_interest) DESC")
  end

  def self.extract_top_three
    sort_companies_by_jobs_interest.limit(3).pluck(:name, "AVG(jobs.level_of_interest)")
  end

  def self.format_results(input)
    input.map { |pair|  pair.join(": ")}
  end
end
