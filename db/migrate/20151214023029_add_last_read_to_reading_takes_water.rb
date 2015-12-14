class AddLastReadToReadingTakesWater < ActiveRecord::Migration
  def change
    add_column :reading_takes_waters, :last_read, :string
    add_column :reading_takes_waters, :sector, :string
    add_column :reading_takes_waters, :id_route, :string
    add_column :reading_takes_waters, :assigned_device, :string
    add_column :reading_takes_waters, :m3, :string
  end
end
