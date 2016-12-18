class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true

  belongs_to :company
  belongs_to :category

  has_many :comments, dependent: :destroy

  def self.groups(group_param)
    if group_param == "location"
      ["Location", all.group_by {|job| job.city}]
    elsif group_param == "interest"
      ["Level of Interest",
      all.group_by {|job| job.level_of_interest}.sort.reverse]
    end
  end

  def self.location(location)
    jobs = all.find_all {|job| job.city.upcase == location.upcase}
    [location, jobs]
  end

  def self.count_by_location
    Job.group(:city).count("id")
  end
end
