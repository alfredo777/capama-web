class CreateFormatFormsToRoles < ActiveRecord::Migration
  def change
    create_table :format_forms_to_roles do |t|
      t.integer :format_form_id
      t.integer :role_id

      t.timestamps
    end
  end
end
