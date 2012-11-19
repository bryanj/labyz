class Question < ActiveRecord::Base
  attr_accessible :world, :title, :content, :user_count, :parent_id

  belongs_to :world
  belongs_to :parent, class_name: Question
  has_many :hints

  before_create :generate_uid

  def parent_uid_string
    "'#{self.parent.uid}'" rescue "null"
  end

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
