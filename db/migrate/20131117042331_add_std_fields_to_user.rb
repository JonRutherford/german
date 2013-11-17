class AddStdFieldsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name
      t.string :email
      t.string :user_name, unique: true
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.boolean :admin, default: false
      t.string :remember_token
      t.string :password_digest
    end

    add_index :users, :remember_token, unique: true
    add_index :users, :user_name, unique: true
    add_index :users, :email, unique: true
    add_index :users, :password_reset_token, unique: true
  end
end