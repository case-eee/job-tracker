class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category_id,  presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy do
    def newest_first
      order("created_at DESC")
    end
  end

  def self.count_per_level_of_interest
    results = self.all.order("level_of_interest DESC").group(:level_of_interest).count
    results.keys.map do |loi|
      { level_of_interest: loi,
        job_count: results[loi]}
    end
  end

  def self.count_per_cities
    results = self.all.order("city ASC").group(:city).count
    results.keys.map do |city|
      { name: city,
        job_count: results[city]}
    end
  end

  def self.sort_all(order_detail)
    self.all.order(order_detail)
  end
end
