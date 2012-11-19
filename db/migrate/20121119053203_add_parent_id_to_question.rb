class AddParentIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :parent_id, :integer
    Question.all.each do |question|
      parent_id = Link.where(next_question_id: question.id).first.question_id rescue nil
      question.update_attributes(parent_id: parent_id)
    end
  end
end
