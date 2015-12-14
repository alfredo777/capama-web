class AddUserInspectIdToInspect < ActiveRecord::Migration
  def change
    add_column :inspects, :user_inspect_id, :integer
  end
end
