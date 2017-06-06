class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  #has_many :tag_jobs
  #has_many :tags, through: :tag_jobs
end
