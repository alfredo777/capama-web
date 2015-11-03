class AddFormatFormIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :format_form_id, :integer
  end
end
