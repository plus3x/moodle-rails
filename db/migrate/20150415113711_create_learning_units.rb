class CreateLearningUnits < ActiveRecord::Migration
  def change
    create_table :learning_units do |t|
      t.string :title, null: false, index: true
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
