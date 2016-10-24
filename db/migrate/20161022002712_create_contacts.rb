class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :full_name
      t.text :position
      t.text :email
      t.references :company, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
