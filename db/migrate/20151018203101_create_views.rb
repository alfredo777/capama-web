class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :viewver_id
      t.string :viewver_type
      t.string :path

      t.timestamps
    end
  end
end
