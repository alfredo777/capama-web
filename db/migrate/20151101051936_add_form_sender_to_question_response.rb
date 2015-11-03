class AddFormSenderToQuestionResponse < ActiveRecord::Migration
  def change
    add_column :question_responses, :form_sender, :string
  end
end
