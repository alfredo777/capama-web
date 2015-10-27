class AddAgentToViews < ActiveRecord::Migration
  def change
    add_column :views, :agent, :string
  end
end
