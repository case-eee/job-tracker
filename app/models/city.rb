class City < ActiveRecord::Base
  validates :name, presence: true
  validates :state, presence: true
  validates :name, uniqueness: true

  has_many :jobs, dependent: :destroy

  def jobs_count
    self.jobs.count
  end
end
