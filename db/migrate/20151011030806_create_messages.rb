class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :talker_id
      t.text :message
      t.string :talker_type

      t.timestamps
    end
  end
end
