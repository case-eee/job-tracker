class Contact < ActiveRecord::Base
  validates :first_name, :last_name, :position, :email, presence: true
  belongs_to :company
end
