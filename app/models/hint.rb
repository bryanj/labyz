class Hint < ActiveRecord::Base
  attr_accessible :content

  belongs_to :question
end
