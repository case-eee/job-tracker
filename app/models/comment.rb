class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :job_id, presence: true

  belongs_to :job

  def self.order_comments
    Comment.order("created_at DESC")
  end

end
