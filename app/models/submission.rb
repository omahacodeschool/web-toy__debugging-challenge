class Submission < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student
  has_one :grade
end