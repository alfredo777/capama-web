class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :role_id
      t.string :permission
      t.boolean :active

      t.timestamps
    end
  end
end
