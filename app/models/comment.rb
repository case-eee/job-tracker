class Comment < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :job

  def self.order_comments
    order(created_at: :desc)
  end
end
