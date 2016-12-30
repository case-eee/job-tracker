class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :company_id
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
