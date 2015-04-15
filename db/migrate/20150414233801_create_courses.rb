class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false, uniqness: true

      t.timestamps null: false

      t.index :title
    end
  end
end
