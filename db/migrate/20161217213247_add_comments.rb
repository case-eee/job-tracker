class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.timestamps null: false
    end

    add_reference :comments, :job, index: true
  end
end
