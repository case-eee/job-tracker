class Category < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  has_many :jobs, dependent: :destroy
end
