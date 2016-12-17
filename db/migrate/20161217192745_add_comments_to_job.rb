class AddCommentsToJob < ActiveRecord::Migration
  def change

    add_reference :comments, :job, foreign_key: true
  end
end
