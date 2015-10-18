class AddPhoneToUserHelp < ActiveRecord::Migration
  def change
    add_column :user_helps, :phone, :string, default: '12312414'
    add_column :user_helps, :open, :boolean, default: false
    add_column :user_helps, :solve, :boolean, default: false
    add_column :user_helps, :open_chat, :boolean, default: false
  end
end
