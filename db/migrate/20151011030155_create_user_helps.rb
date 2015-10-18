class CreateUserHelps < ActiveRecord::Migration
  def change
    create_table :user_helps do |t|
      t.string :email
      t.string :cause
      t.text :explanation
      t.string :area
      t.string :user_id

      t.timestamps
    end
  end
end
