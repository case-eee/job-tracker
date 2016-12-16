class AddReferenceToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :category
  end
end
