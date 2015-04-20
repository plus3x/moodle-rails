class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :discussion, null: false, index: true, foreign_key: true
      t.belongs_to :parent, index: true
      t.belongs_to :author, null: false, index: true
      t.text :text, null: false

      t.timestamps null: false
    end
  end
end
