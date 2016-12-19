class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :jobs, dependent: :destroy do
    def bycity
      order("city ASC")
    end
  end
  has_many :contacts, dependent: :destroy

  def self.all_sorted
    self.all.order("name ASC")
  end

  def self.top_companies_by_average_level_of_interest(threshold = 3)
    results = self.joins(:jobs).group(:name, :company_id).order("average_level_of_interest DESC").limit(threshold).average(:level_of_interest)
    results.keys.map do |company|
      { name: company.first,
        id: company.last,
        average_level_of_interest: results[company].to_f.round(2)}
    end
  end
end
