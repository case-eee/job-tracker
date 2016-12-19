class RemoveCityFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :city, :string
  end
end
