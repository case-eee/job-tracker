class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :city
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.group_by_interest
    jobs = group(:level_of_interest).count
    jobs.sort.reverse.to_h
  end

  def self.find_jobs_by_interest
    jobs_hash = group_by_interest
    found_jobs = []
    jobs_hash.each_key do |key|
      found_jobs << where(level_of_interest: key)
    end
    found_jobs.flatten
  end
end
