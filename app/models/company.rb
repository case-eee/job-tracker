class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.company_average_level_of_interest_all
    joins(:jobs).group(:name).average(:level_of_interest).sort_by{|k,v| -v}[0..2].to_h
  end

end
