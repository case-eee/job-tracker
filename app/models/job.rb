class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, :dependent => :nullify
  

  def self.sort_by(attribute)
    return order(:city).reverse_order if attribute == "location"
    return order(:level_of_interest).reverse_order if attribute == "interest"
  end

  def self.count_by_interest
    group(:level_of_interest).count.sort_by {|k , v| v}.reverse[0..12]
  end

  def self.companies_by_interest
    group(:company).average(:level_of_interest).sort_by {|k , v| v}.reverse[0..2]
  end

  def self.count_by_location
    group(:city).count
  end

end