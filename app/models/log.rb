class Log < ActiveRecord::Base
  attr_accessible :world_id, :question_id, :user_id

  belongs_to :world
  belongs_to :question
  belongs_to :user
end
