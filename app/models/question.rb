class Question < ActiveRecord::Base
  attr_accessible :world, :title, :content

  belongs_to :world

  before_create :generate_uid

  private
    def generate_uid
      begin
        uid = rand(16**7..16**8-1).to_s(16)
      end while Question.where(uid: uid).count>0
      self.uid = uid
      world = self.world
      world.update_attributes(first_uid: uid) if world.questions.count==0
    end
end
