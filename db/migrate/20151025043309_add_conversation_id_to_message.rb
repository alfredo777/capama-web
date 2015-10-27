class AddConversationIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :conversation_id, :integer
  end
  add_index :messages, [:talker_id, :talker_type]
end
