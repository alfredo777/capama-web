class CreatePublicImages < ActiveRecord::Migration
  def change
    create_table :public_images do |t|
      t.string :img
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps
    end
    add_index :messages, [:imageable_id, :imageable_type]
  end

end
