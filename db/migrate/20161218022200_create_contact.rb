class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :position
      t.string :email

      t.references :company, index: true, foreign_key: true
    end
  end
end
