class AddCategoryToJobs < ActiveRecord::Migration
  def change

    add_reference :jobs, :category, foreign_key: true
  end
end
