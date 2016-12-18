class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  validates :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.payload
    payload = Hash.new()
    payload[:top_companies]             = top_companies
    payload[:sort_by_city]              = sort_by_city
    payload[:sort_by_level_of_interest] = sort_by_level_of_interest
    payload
  end

  def self.top_companies
    "top three cities"
  end

  def self.sort_by_city
    "grouped by city"
  end

  def self.sort_by_level_of_interest
    "sorted_by_level_of_interest"
  end

end
