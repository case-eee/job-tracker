class AddColumnToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :job
  end
end
