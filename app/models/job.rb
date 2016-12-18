class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :city
  belongs_to :category
  has_many :comments

  def validate!
   if ( title.nil?) || (title.empty?)
     errors.add(:title, :blank, message: "cannot be empty")
   end
 end
end
