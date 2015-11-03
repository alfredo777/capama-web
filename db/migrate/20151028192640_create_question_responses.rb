class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.string :question_id
      t.string :question_value

      t.timestamps
    end
  end
end
