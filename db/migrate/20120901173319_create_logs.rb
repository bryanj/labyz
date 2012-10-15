class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :world_id
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
