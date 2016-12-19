class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :position
      t.string :email
    end

    add_reference :contacts, :company, index: true, foreign_key: true
  end
end
