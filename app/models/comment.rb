class Comment < ActiveRecord::Base
  belongs_to :job
  validates :author, presence: true
  validates :body, presence: true
end
