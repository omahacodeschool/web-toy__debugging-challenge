MyApp.get "/" do
  @students = Student.all
  @assignments = Assignment.all
  erb :"admin/home"
end

MyApp.get "/students/:student_id" do
  @student = Student.find(params[:student_id])
  @assignments = Assignment.all
  erb :"/admin/student"
end

MyApp.get "/assignment/:assignment_object_id" do
  @assignment = Assignment.find(params[:assignment_object_id])
  erb :"/admin/view_assignment"
end

