class Comment < ActiveRecord::Base
  belongs_to :job
  validates :content, presence: true
end