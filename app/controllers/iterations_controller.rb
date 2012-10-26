class IterationsController < ApplicationController
#before_filter :test, :except => [:index, :new, :edit, :show]
before_filter :access_iteration, :only => [:create,:deleteiteration, :edit ]
can_edit_on_the_spot
def test
	@project = Project.find(params[:project_id])	
	@new_params = params[:iteration]
	raise @new_params.each_value { |key| puts "#{key}" }.inspect
	flag = 0
	@project.iteration.each do |it|
	@endd = it.end_date
	if @enddate < @endd
	flag += 1
	else
	flag = 0
	end
	end
	if flag == 0
	redirect_to "create"
	else
	raise "you selecting date is already there".inspect
	end
end

def index
    @project = Project.find(params[:project_id])
    @iterations = Iteration.find(:all)
end

def new
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.new

end

def edit
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:id])
end


 def access_iteration
 	@project = Project.find(params[:project_id])
	if  !User.current.admin
	flash[:notice] = "Not an authorised user to create/modify/delete an iteration"
	redirect_to project_path(@project.id)
	end
 end


def create
	  @project = Project.find(params[:project_id])
		 @iteration = @project.iteration.new(params[:iteration])

	if @iteration.status == "Open"
		@all_iterations = Iteration.find(:all, :select => "status" ,:conditions => {:status => "Open", :project_id => @project.id}).map(&:status).count
	#raise @all_iterations.inspect
	if @all_iterations >= 1
		flash[:error] ="one iteration is already opened. please select planned"
		redirect_to new_project_iteration_path(@project.id) and return
	else
		@all_enddates = Iteration.find(:all, :select => "end_date" ,:conditions => {:project_id => @project.id}).map(&:end_date)
	if @all_enddates == []
		@iteration.save
		redirect_to project_iteration_path(@project.id, @iteration.id ) and return
	else
		@all_enddates.each do |end_date|
	if @iteration.start_date > end_date
		@iteration.save
		redirect_to project_iteration_path(@project.id, @iteration.id ) and return
	else
		flash[:error] ="Please select differenct dates"
		redirect_to new_project_iteration_path(@project.id) and return
	end
	end
	end
	end
	else
	@all_enddates = Iteration.find(:all, :select => "end_date" ,:conditions => {:project_id => @project.id}).map(&:end_date)
	if @all_enddates == []
	@iteration.save
	redirect_to project_path(@project.id) and return
	else
	@all_enddates.each do |end_date|
	if @iteration.start_date > end_date
	@iteration.save
	redirect_to project_path(@project.id)  and return
	else
	flash[:error] ="Please select differenct dates"
	redirect_to new_project_iteration_path(@project.id) and return
	end
	end
	end

	end
end

def update
   @project = Project.find(params[:project_id])
   @iteration = @project.iteration.find(params[:id])

   if @iteration.update_attributes(params[:iteration])
if @iteration.status == "Closed"
raise "yes ".inspect
end
      redirect_to project_iteration_path(@project.id,@iteration.id)
   else
       render :action => "edit"
   end
 end

def show
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:id])
    @iterationpagination = @iteration.story.paginate(:page => params[:page], :per_page => 8)
    @iterations = Iteration.find(:all)
    render :action => "show"
end
def deleteiteration
    @project_id = params[:project_id]
    @it_id = params[:id]
   @iteration = Iteration.find(@it_id )
   @iteration.destroy
   redirect_to project_path(@project_id)
end
end
