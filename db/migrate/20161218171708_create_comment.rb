class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content

      t.timestamps null: false
      t.references :job, index: true, foreign_key: true
    end
  end
end
