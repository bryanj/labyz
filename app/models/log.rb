class Log < ActiveRecord::Base
  attr_accessible :world_id, :question_id, :user_id

  belongs_to :world
  belongs_to :question
  belongs_to :user

  after_create :count_solver

  private
    def count_solver
      self.question.update_attributes(user_count: Log.where(question_id: self.question_id).count)
    end
end
