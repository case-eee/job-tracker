class Comment < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :job

  def self.reverse_chronological
    Comment.order("created_at DESC")
  end
end