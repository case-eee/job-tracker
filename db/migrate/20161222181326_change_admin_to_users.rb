class ChangeAdminToUsers < ActiveRecord::Migration
  def change
    change_column :users, :admin, :integer, default: 0
  end
end
