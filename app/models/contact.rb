class Contact < ActiveRecord::Base
  validates :full_name,  presence:  true
  validates :full_name,  uniqueness: true
  validates :position,   presence:  true
  validates :email,      presence:  true
  validates :company_id, presence:  true

  belongs_to :company
end
