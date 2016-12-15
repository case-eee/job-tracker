class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company

  def validate!
   errors.add(:title, :blank, message: "cannot be empty") if( title.nil?) || (title.empty?)
 end
end
