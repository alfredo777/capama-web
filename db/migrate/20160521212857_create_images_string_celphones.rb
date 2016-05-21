class CreateImagesStringCelphones < ActiveRecord::Migration
  def change
    create_table :images_string_celphones do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.text :img, :limit => 1073741823

      t.timestamps
    end
  end
end
