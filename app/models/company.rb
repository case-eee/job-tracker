class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.company_average_level_of_interest
    @companies.each do |company|
      company.jobs.average(:level_of_interest)
    end
  end
  #
  #   order companes by average level of interest, high to low
  #   limit to top 3
  #   show top three company.names and their interest values

end
