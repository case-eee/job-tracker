class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company

  def validate!
   if ( title.nil?) || (title.empty?)
     errors.add(:title, :blank, message: "cannot be empty")
   end
 end
end
