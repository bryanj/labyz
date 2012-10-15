class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.integer :question_id
      t.string :content

      t.timestamps
    end
  end
end
