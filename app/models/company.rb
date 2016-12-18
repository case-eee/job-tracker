class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_three_companies_by_level_of_interest
    grouped_company_averages = Job.group(:company_id).average(:level_of_interest)
    grouped_company_averages.reduce({}) do |hash, (id, average)|
      hash[id] = average.to_f.round(2).to_s
      hash
    end.sort_by {|k,v| v}.reverse[0..2]
  end
end
