class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.count_by_level_of_interest
    where(level_of_interest: 75..100).count
  end

  def self.count_by_location
    group(:city).count("id").sort_by{ |k,v| v }.reverse
  end

end
