MyApp.get "/students/:student_id" do
  @student = Student.find(params[:student_id])
  @assignments = Assignment.all
  @students = Student.all
  erb :"/admin/students"
end

MyApp.get "/assignments/:assignment_id" do
  @students = Student.all
  @assignment = Assignment.find(params[:assignment_id])
  erb :"/admin/assignments"
end

MyApp.get "/" do
  @students = Student.all
  @assignments = Assignment.all
  erb :"/admin/home"
end
