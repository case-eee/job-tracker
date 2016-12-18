class Contact < ActiveRecord::Base
  validates :name, :position, presence: true
  belongs_to :company
end
