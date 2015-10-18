class AddModulToPermission < ActiveRecord::Migration
  def change
    add_column :permissions, :modul, :string
  end
end
