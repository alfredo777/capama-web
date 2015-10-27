class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :title
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
