class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :format_folio
      t.integer :in_charge

      t.timestamps
    end
  end
end
