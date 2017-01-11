class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many   :comments
  has_many   :job_tags
  has_many   :tags, through: :job_tags

  def order_by_time_created
    comments.order(created_at: :desc)
  end

  def self.level_of_interest
    Job.group(:level_of_interest).count
  end
end
