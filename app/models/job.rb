class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true

  has_many   :comments
  belongs_to :company
  belongs_to :category


  def self.count_by_interest
    Job.order(level_of_interest: :desc).group(:level_of_interest).count
  end

  def self.sort_by_interest
    Job.order(level_of_interest: :desc)
  end

  def self.sort_by_location
    Job.group(:city)
  end
end
