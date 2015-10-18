class AddUserHelpIdToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :user_help_id, :integer
  end
end
