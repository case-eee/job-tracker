class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :job_id

      t.timestamps null: false
    end
    
    add_foreign_key :comments, :jobs, column: :job_id
    add_index "comments", ["job_id"], name: "index_comments_on_job_id", using: :btree
  end
end
