class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category_id, presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.location
    group(:city).order(:city).count.keys.map do |city|
      [city, Job.where(city: city).pluck(:title)]
    end
  end

  def self.job_by_level_of_interest
    Job.group(:title).pluck(:title).group_by do |job|
      Job.find_by(title: job).level_of_interest
    end
  end

  def self.link(title)
    find_by(title: title)
  end

  def self.count_by_level_of_interest
    Job.group(:level_of_interest).count(:title)
  end

end
