class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true

  belongs_to :company
  belongs_to :category

  has_many :comments, dependent: :destroy


  def self.create_groups(group_param)
    if group_param == "location"
      ["City", all.group_by {|job| job.city}]
    elsif group_param == "interest"
      ["Level of Interest", all.group_by {|job| job.level_of_interest}]
    end
  end
end
