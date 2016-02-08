

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

MyApp.get "/assignments" do
  @assignment = Assignment.find(params[:id])
  erb :"/admin/assignment"
end

MyApp.get "/assignment/1" do
  erb :"/admin/view_assignment"
end

MyApp.get "/assignment/2" do
  erb :"/admin/str_seg_assignment"
end

MyApp.get "/assignment/3" do
  erb :"/admin/prep_assignment"
end

MyApp.get "/assignment/4" do
  erb :"/admin/sinatra_assignment"
end

MyApp.get "/assignment/5" do
  erb :"/admin/data_assignment"
end