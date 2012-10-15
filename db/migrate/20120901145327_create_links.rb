class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :question_id
      t.integer :next_question_id
      t.string :answer

      t.timestamps
    end
  end
end
