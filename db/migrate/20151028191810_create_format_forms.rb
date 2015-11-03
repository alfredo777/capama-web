class CreateFormatForms < ActiveRecord::Migration
  def change
    create_table :format_forms do |t|
      t.string :title
      t.text :description
      t.boolean :public, default: false
      t.string :tclass
      t.timestamps
    end
  end
end
