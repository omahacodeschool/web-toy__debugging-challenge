MyApp.get "/" do
  @student = Student.all
  @assignments = Assignment.all
  erb :"admin/home"
end

MyApp.get "/students/:student_id" do
  @student = Student.find(params[:student_id])
  @assignments = Assignment.all
  erb :"/admin/student"
end

MyApp.get "/assignment/:id" do
  @assignment = Assignment.find(params[:id])
  @student = Student.all
  erb :"/admin/view_assignment"
end