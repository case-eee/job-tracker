class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def average_interest
    self.jobs.average(:level_of_interest).to_i
  end

  def self.ranked_by_interest
    all.sort_by {|company| company.average_interest}.reverse.take(3)
  end
end
