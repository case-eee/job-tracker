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
    payload[:interest_levels]           = interest_levels
    payload
  end

  def self.top_companies
    Job.group(:company).order('average_level_of_interest desc').limit(3).average("level_of_interest")
  end

  def self.sort_by_city
    Job.group(:city).order('count_id desc').count('id')
  end

  def self.sort_by_level_of_interest
    Job.order("level_of_interest desc")
  end

  def self.interest_levels
    interest_levels = Hash.new()
    interest_levels[25] = Job.where("level_of_interest < ?" [24]).count
    interest_levels[50] = Job.where(level_of_interest: 25..49).count
    interest_levels[75] = Job.where(level_of_interest: 50..74).count
    interest_levels[100] = Job.where("level_of_interest > ?" [74]).count
    interest_levels
  end
end
