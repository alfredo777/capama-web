class AddDiameterToReadingTakesWater < ActiveRecord::Migration
  def change
    add_column :reading_takes_waters, :diameter, :string
  end
end
