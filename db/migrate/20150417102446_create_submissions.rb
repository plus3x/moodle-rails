class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.belongs_to :files, index: true, foreign_key: true
      t.belongs_to :author, index: true, foreign_key: true
      t.belongs_to :activity, index: true, foreign_key: true
      t.string :comment, null: false
      t.integer :grade, default: 0

      t.timestamps null: false
    end
  end
end
