class RemoveColumnJobIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :job_id
  end
end
