class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :delete_all

  def self.jobs_by_level_of_interest
    group(:level_of_interest).count.sort_by {|k, v| k }
  end

  def self.jobs_by_location
    grouped = all.group_by(&:city)
    count_jobs_in_location(grouped)
  end

  def self.count_jobs_in_location(input)
    location_with_count = input.map do |location, jobs|
      total = 0
      jobs.each do |job|
        total += jobs.count
      end
      @total = total
      @location = location
      [@location, @total]
    end
  end
end
