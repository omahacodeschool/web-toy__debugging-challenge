class Assignment < ActiveRecord::Base
  has_many :submissions
  has_many :grades, :through => :submissions
  has_many :students, :through => :submissions
end