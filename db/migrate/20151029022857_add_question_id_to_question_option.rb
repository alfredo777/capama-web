class AddQuestionIdToQuestionOption < ActiveRecord::Migration
  def change
    add_column :question_options, :question_id, :integer
  end
end
