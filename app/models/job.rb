class Job < ActiveRecord::Base
  validates   :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to  :company
  belongs_to  :category
  has_many    :comments
  has_many    :taggings
  has_many    :tags, through: :taggings
end
