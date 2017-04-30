class CreateJobTags < ActiveRecord::Migration
  def change
    create_table :job_tags do |t|
      t.references :job
      t.references :tag

      t.timestamps null: false
    end
  end
end
