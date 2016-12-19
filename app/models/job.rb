class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.count_by_level_of_interest
    order(level_of_interest: :desc).group(:level_of_interest).count
  end
end
