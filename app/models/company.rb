class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true

  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.sorted_companies
    order(:city)
  end

  # def self.sorted_interests
  #   joins(:jobs).
  #   order("jobs.level_of_interest DESC")
  # end

  def self.top_three_interests
    joins(:jobs).
    group(:name).
    order("AVG(jobs.level_of_interest) DESC").
    limit(3).
    pluck(:name, "AVG(jobs.level_of_interest)")
  end

  def self.location_count
    joins(:jobs).group(:city).order('count_id desc').count('id')

  end
end
