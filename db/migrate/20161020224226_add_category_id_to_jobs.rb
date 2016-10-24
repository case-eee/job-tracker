class AddCategoryIdToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :category, index: true, foreign_key: true, on_delete: :cascade
  end
end
