class DropColumDataAccess < ActiveRecord::Migration
  def change
    remove_column :reading_takes_waters, :data_access
    add_column :reading_takes_waters, :data_access, :string
  end
end
