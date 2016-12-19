class Contact < ActiveRecord::Base
  validates :full_name, :position, :email, :company_id, presence: true
  belongs_to :company
end