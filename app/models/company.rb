class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :jobs, dependent: :destroy do
    def bycity
      order("city ASC")
    end
  end
  has_many :contacts, dependent: :destroy
end
