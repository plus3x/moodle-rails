class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :login, index: true, null: false
      t.string :email, index: true, null: false
      t.string :role, index: true, null: false, default: 'guest'

      t.timestamps null: false
    end
  end
end
