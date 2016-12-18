class City < ActiveRecord::Base
  validates :name, presence: true
  validates :state, presence: true
  validates :state, uniqueness: true
  validates :name, uniqueness: true
  
  has_many :jobs
end
