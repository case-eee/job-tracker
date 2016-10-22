class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments

  def sorted_comments
    comments.order(created_at: :desc)
  end

  def self.sorted_interests
    order(level_of_interest: :desc)
  end

end
