class CreateJobsTags < ActiveRecord::Migration
  def change
    create_table :jobs_tags do |t|
      t.integer :job_id
      t.integer :tag_id

      t.timestamps null: false
    end

    add_foreign_key :jobs_tags, :jobs, column: :job_id, on_delete: :cascade
    add_index "jobs_tags", ["job_id"], name: "index_jobs_tags_on_job_id", using: :btree

    add_foreign_key :jobs_tags, :tags, column: :tag_id, on_delete: :cascade
    add_index "jobs_tags", ["tag_id"], name: "index_jobs_tags_on_tag_id", using: :btree
  end
end
