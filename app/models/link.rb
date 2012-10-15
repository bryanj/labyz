class Link < ActiveRecord::Base
  attr_accessible :question, :next_question, :answer

  belongs_to :question
  belongs_to :next_question, class_name: Question
end
