puts "Making a bunch of random students..."
dm = Student.create(name: "Diana Mkrtchyan")
hp = Student.create(name: "Heather Praisewater")
nr = Student.create(name: "Nathaniel Ruiz")
ks = Student.create(name: "Kyle Schmit")
jh = Student.create(name: "Jen Homann")
tp = Student.create(name: "Tony Plaza")

students = [dm, hp, nr, ks, jh, tp]

puts "And a bunch of assignments..."
rps = Assignment.create(title: "Rock-Paper-Scissors", difficulty: 52)
str = Assignment.create(title: "String Segementer", difficulty: 89)
prp = Assignment.create(title: "Prep Work", difficulty: 71)
sst = Assignment.create(title: "Sinatra Starter", difficulty: 67)
dbb = Assignment.create(title: "Database Starter", difficulty: 59)

assignments = [rps, str, prp, sst, dbb]

puts "Simulating submissions of some assignments for each student..."
# For each student...
students.each do |student|

  # And for each assignment...
  assignments.each do |a|
    chance_of_assignment_being_submitted = (1..10).to_a.sample

    if chance_of_assignment_being_submitted > 5
      Submission.create(student_id: student.id, assignment_id: a.id)
    end
  end
end

puts "And random grades too."
# Then for each submission, make a grade randomly.
Submission.all.each do |sub|
  random_score = (0..100).to_a.sample
  sub.create_grade(score: random_score)
end

puts "Done."