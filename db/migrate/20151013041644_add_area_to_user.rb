class AddAreaToUser < ActiveRecord::Migration
  def change
    add_column :users, :area, :string
    add_column :users, :address, :text
    add_column :users, :responsible_for_accidents, :string
    add_column :users, :social_security, :string
    add_column :users, :position, :string 
    add_column :users, :immediate_boss, :string
    add_column :users, :immediate_boss_email, :string
  end
end
