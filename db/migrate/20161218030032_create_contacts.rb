class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :first_name
      t.text :last_name
      t.text :position
      t.text :email
      t.references :company

      t.timestamps null: false
    end
  end
end
