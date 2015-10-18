class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.boolean :active_role

      t.timestamps
    end
  end
end
