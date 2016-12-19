class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs, :dependent => :nullify
  has_many :contacts, :dependent => :nullify

  
end
