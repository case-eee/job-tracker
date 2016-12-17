class Category < ActiveRecord::Base
  has_many :jobs, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
