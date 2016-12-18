class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :position, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  belongs_to :company
end
