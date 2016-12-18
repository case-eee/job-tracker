class Contact < ActiveRecord::Base
  validates :full_name, presence: true, uniqueness: true
  validates :position, :email, :company_id, presence: true

  belongs_to :company
end