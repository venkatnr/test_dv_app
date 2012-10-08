class AttendanceController < ApplicationController

def index 
@story = Story.find(params[:story_id])
@attendances = @story.attendances.find(:all)

end 

def new
@story = Story.find(params[:story_id])

  @attendance = @story.attendances.new
 #$ raise @absence.inspect
  
end 

def create
@story = Story.find(params[:story_id])
@attendance = @story.attendances.create(params[:attendance])
if @attendance.save 
flash[:notice] = "Leave successfully applied"
render :action => "show"
end

def show
@attendance = Attendance.find(params[:id])
render :action => "index"
end
 
end 

def edit
@attendance = Attendance.find(params[:id])
end 

def update
@attendance = Attendance.find(params[:id])
@attendance.update_attributes(params[:attendance])
@attendance.save
end

def destroy

end 


end
