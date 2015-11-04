class CreatePruebes < ActiveRecord::Migration
  def change
    create_table :pruebes do |t|
      t.string :tiele
      t.integer :aptitude
      t.float :value
      t.boolean :trueelse
      t.text :description

      t.timestamps
    end
  end
end
