class CreateUserInspects < ActiveRecord::Migration
  def change
    create_table :user_inspects do |t|
      t.integer :user_id
      t.date :date_inspect

      t.timestamps
    end
  end
end
