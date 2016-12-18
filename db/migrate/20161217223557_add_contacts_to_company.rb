class AddContactsToCompany < ActiveRecord::Migration
  def change

    add_reference :contacts, :company, foreign_key: true
  end
end
