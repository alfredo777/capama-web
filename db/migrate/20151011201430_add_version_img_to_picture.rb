class AddVersionImgToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :version_img, :string
    remove_columns :pictures, :url
  end
end
