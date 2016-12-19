class Contact < ActiveRecord::Base
  validates :full_name, :position, :email, presence: true
  belongs_to :company
end
