class CreateImagesStringCelphones < ActiveRecord::Migration
  def change
    create_table :images_string_celphones do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.text :img, :limit => 4294967295

      t.timestamps
    end
  end
end
