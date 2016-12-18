class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :company
  belongs_to :category
end
