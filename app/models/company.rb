class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts


  def self.average_interest_among_jobs
    Company.all.map do |company|
      [company.jobs.average(:level_of_interest).to_f.round(2), company.name]
    end.sort.reverse.take(3)
  end
end
