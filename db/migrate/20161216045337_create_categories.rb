class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title, unique: true
    end
  end
end
