class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy 
  has_many :contacts
end
