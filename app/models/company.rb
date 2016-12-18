class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  has_many :jobs, dependent: :destroy
  has_many :contacts


  def self.top_3_by_average_interest
    company_list = Company.all.reduce(Array.new) do |list, company|
      list << company unless company.jobs.empty?
      list
    end
    company_list.sort_by do |company|
      company.jobs.average(:level_of_interest)
    end.reverse[0..2]
  end

  def self.job_count_by_location
    Company.joins(:jobs).group(:city).count
  end

  def average_level_of_interest
    self.jobs.average(:level_of_interest).round(3)
  end
end
