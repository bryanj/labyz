class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :world_id
      t.string :title
      t.string :content
      t.string :uid

      t.timestamps
    end

    add_index :questions, :uid
  end
end
