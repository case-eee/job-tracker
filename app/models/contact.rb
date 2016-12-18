class Contact < ActiveRecord::Base
  validates :full_name, :position, :email, presence: true
  validates :full_name, uniqueness: true
  belongs_to :company
end
