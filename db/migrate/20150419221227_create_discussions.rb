class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title, null: false, index: true
      t.text :question, null: false
      t.belongs_to :author, null: false, index: true
      t.belongs_to :course, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
