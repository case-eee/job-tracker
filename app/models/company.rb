class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def average_level_of_interest
    jobs.average(:level_of_interest).round(2) rescue 0
  end

  def self.top_companies(amount)
    sorted_companies = all.sort_by {|company| company.average_level_of_interest}
    sorted_companies.reverse[0..amount - 1]
  end
end