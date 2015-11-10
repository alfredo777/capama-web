class CreateReadingTakesWaters < ActiveRecord::Migration
  def change
    create_table :reading_takes_waters do |t|
      t.string :business_name
      t.string :address
      t.string :colony
      t.string :water_meter
      t.string :reference
      t.text :observations
      t.string :sx
      t.string :ux
      t.string :stage
      t.string :account_number
      t.string :abnormalities
      t.string :lecture
      t.datetime :data_access
      t.integer :reading_assignment_id
      t.boolean :successfully_completed

      t.timestamps
    end

    add_index :reading_takes_waters, :business_name
    add_index :reading_takes_waters, :water_meter
  end
end
