class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.belongs_to :author, index: true, foreign_key: true
      t.belongs_to :activity, index: true, foreign_key: true
      t.belongs_to :submission, index: true, foreign_key: true
      t.string :file

      t.timestamps null: false
    end
  end
end
