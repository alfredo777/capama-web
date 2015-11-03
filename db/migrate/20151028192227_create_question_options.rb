class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.string :qotag
      t.string :qovalue

      t.timestamps
    end
  end
end
