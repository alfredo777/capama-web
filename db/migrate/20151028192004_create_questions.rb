class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :qtag
      t.string :qtype
      t.string :qclass
      
      t.timestamps
    end
  end
end
