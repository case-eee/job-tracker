class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sorted_comments(job)
    job.comments.order(created_at: :desc)
  end
end
