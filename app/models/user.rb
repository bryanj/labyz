class User < ActiveRecord::Base
  attr_accessible :username

  after_create :set_access

  def password?(pass)
    self.password_hash == Digest::SHA2.hexdigest(self.password_salt + pass)
  end

  private
    def set_access
      World.all.each do |world|
        question = Question.where(uid: world.first_uid).first
	Log.create(world_id: world.id, question_id: question.id, user_id: self.id)
      end
    end
end
