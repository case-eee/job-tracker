class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.average_level_of_interest

  end

  def self.top_companies_by_interest
    
  end

end