class Tag < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  has_many :taggings, dependent: :destroy
  has_many :jobs, through: :taggings
end
