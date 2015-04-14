class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :login, null: false
      t.string :email, null: false
      t.string :role, null: false, default: 'guest'

      t.timestamps null: false

      t.index :login, unique: true
      t.index :email, unique: true
      t.index :role
    end
  end
end
