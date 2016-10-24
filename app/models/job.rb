class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_interest
    order(:level_of_interest)
  end

  def self.breakdown_by_level_of_interest
    breakdowns = group(:level_of_interest).count(:level_of_interest)
    format_breakdowns(breakdowns)
  end

  def self.average_level_of_interest
    average(:level_of_interest).round(3)
  end

  private

  def self.format_breakdowns(breakdowns)
    breakdowns.map { |breakdown|  breakdown.join(": ")}
  end
end
