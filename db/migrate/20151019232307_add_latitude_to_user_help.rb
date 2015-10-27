class AddLatitudeToUserHelp < ActiveRecord::Migration
  def change
    add_column :user_helps, :latitude, :string
    add_column :user_helps, :longitude, :string
  end
end
