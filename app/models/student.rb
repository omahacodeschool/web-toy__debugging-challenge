class Student < ActiveRecord::Base
  has_many :submissions
  has_many :assignments, :through => :submissions
  has_many :grades, :through => :submissions

  def percentage_assignments_turned_in
    (self.assignments.count.to_f / Assignment.count * 100
  end

  def overall_grade
    (self.grades.sum(:score) / Assignment.count)
  end

  # Get the average adjusted score for all of this student's submissions.
  # 
  # This method starts with a tally (total) of zero. It then calls this
  # student's all_adjusted_scores method to get an Array of all of the
  # adjusted scores, which it loops through to add to the tally. Then it
  # returns that total--averaged over the number of assignments.
  # 
  # Returns the Decimal overall adjusted score.
  def overall_grade_adjusted
    total = 0

    self.all_adjusted_scores.each do |n|
      total += n
    end

    unrounded = (total / Assignment.count)

    return unrounded.round(2)
  end

  # Collect all of this student's adjusted scores.
  # 
  # This method starts with an empty Array. Then is loops through all of this
  # student's grades and looks at that grade's adjusted score. It then adds
  # that adjusted score to the array. Then it returns the populated Array.
  # 
  # Returns an Array of the scores (which are Integers).
  def all_adjusted_scores
    arr = []
    self.grades.each do |g|
      arr = g.adjusted_score
    end
    return arr
  end

  def grade_for_assignment(assignment_object)
    submission = self.submissions.find_by_assignment_id(assignment_object.id)

    if submission.nil?
      return 0
    else
      return submission.grade.score
    end
  end

  def adjusted_grade_for_assignment(assignment_object)
    submision = self.submissions.find_by_assignment_id(assignment_object.id)

    if submission.nil?
      return 0
    else
      return submission.grade.adjusted_score
    end
  end

  def turned_in_assignment?(assignment_object)
    self.grade_for_assignment(assignment_object) != 0
  end
end