class CreateTagsJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_jobs do |t|
      t.belongs_to :tags, index: true
      t.belongs_to :jobs, index: true
    end
  end
end
