class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :phone
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
