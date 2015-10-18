class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :rhash
      t.string :card
      t.string :password
      t.integer :role_id
      t.string :name

      t.timestamps
    end
     add_index :users, :card
  end
end
