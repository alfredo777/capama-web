class CreateCelphoneImages < ActiveRecord::Migration
  def change
    create_table :celphone_images do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.string :img

      t.timestamps
    end
  end
end
