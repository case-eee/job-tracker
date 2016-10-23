class Tag < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true

  has_many :jobs_tags, dependent: :destroy
  has_many :jobs, through: :jobs_tags, dependent: :destroy
end
