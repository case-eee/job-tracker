class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.by_location
    order(:city)
  end

  def self.by_interest
    order(level_of_interest: :desc)
  end

  def self.in(location)
    where(city: location)
  end
end
