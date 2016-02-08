class Grade < ActiveRecord::Base
  belongs_to :submission
  has_one :assignment, :through => :submission

  def adjusted_score
    unrounded = (self.assignment.difficulty.to_f / 100) * self.score
    return unrounded.round(2)
  end
end