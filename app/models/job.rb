class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  validates :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy
end
