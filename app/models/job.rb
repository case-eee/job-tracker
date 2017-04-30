class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :job_tags
  has_many :tags, through: :job_tags


  scope :location, -> (location) {where city: location}
  scope :interest, -> (interest) {where(level_of_interest: nil).order('level_of_interest desc')}

  def self.count_by_level_of_interest
    group(:level_of_interest).count.sort_by{ |k,v| k }.reverse.to_h
  end

  def self.count_by_location
    group(:city).order('count_id desc').count(:id)
  end

end
