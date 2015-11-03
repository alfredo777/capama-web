class TicketTypeToUserHelp < ActiveRecord::Migration
  def change
    add_column :user_helps, :ticket_type, :string, default: "external"
  end
end
