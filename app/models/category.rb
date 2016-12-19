class Category < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true

  has_many :jobs do
    def sorted
      order("title ASC")
    end
  end

  def self.all_sorted
    self.all.order("title ASC")
  end
end