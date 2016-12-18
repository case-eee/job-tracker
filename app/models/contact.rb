class Contact < ActiveRecord::Base
  validates :first_name, :last_name, :position, :email, presence: true
  validates_uniqueness_of :first_name, scope: [:last_name]
  belongs_to :company
end
