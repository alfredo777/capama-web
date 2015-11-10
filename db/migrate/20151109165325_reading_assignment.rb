class ReadingAssignment < ActiveRecord::Migration
  def change
    create_table :reading_assignments do |t|
      t.integer :user_id
      t.date :future_scheduled
      t.string :route_number
      t.datetime :synchronization_date
    end

    add_index :reading_assignments, :user_id
    add_index :reading_assignments, :synchronization_date
     
  end
end
