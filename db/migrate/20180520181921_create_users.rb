class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.integer :elo, null: false, default: 2000
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :reset_password_token
      t.datetime :reset_password_token_sent_at, null: false, default: ''
      t.timestamps
    end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
