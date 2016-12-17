class Category < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :jobs

  def arrange
    jobs.pluck(:title).join(", ")
  end
end
