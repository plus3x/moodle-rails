class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title, null: false, index: true
      t.belongs_to :learning_unit, index: true, foreign_key: true
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
