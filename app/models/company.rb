class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts, dependent: :delete_all

  def self.top_three_by_interest
    joins(:jobs).
    group(:name).
    order("AVG(jobs.level_of_interest) DESC").
    limit(3).
    pluck(:name, "AVG(jobs.level_of_interest)")
  end

end
