class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  
  has_many :jobs, dependent: :destroy
end
