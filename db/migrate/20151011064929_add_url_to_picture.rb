class AddUrlToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :url, :string
    add_column :pictures, :user_id, :integer
    remove_column :pictures, :imageable_id
    remove_column :pictures, :imageable_type
  end
end
