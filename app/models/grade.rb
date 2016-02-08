class Grade < ActiveRecord::Base
  belongs_to :submission
  has_one :assignment, :through => :submission

  def adjusted_score
    (self.assignment.difficulty.to_f / 100) * self.score

  end
end