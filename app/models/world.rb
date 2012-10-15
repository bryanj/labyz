class World < ActiveRecord::Base
  attr_accessible :name, :first_uid

  has_many :questions
end
