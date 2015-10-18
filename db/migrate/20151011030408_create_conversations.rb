class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_id
      t.integer :customer_id
      t.boolean :open_conversation
      t.boolean :close_conversation

      t.timestamps
    end
  end
end
