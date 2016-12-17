class Comment < ActiveRecord::Base
  validates :author, :content, :job_id, presence: true
  belongs_to :job
end
