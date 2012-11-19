class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id, :deleted

  belongs_to :user

  default_scope where(deleted:false).order('id desc')
end
