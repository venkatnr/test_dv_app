class StoriesController < ApplicationController


def index
@project = Project.find(params[:project_id])
  @iteration = Iteration.find(params[:iteration_id])
@stories = Story.find(:all)

end

def new

 @iteration = Iteration.find(params[:iteration_id])

@story = @iteration.story.new

end


 def access_stories
	if  !User.current.admin
	flash[:notice] = "Not an authorised user to create an iteration"
	redirect_to home_path
	end
 end


def create
	@project = Project.find(params[:project_id])
	 @iteration = Iteration.find(params[:iteration_id])
      @story = @iteration.story.create(params[:story])	
		redirect_to project_iteration_path(@project.id, @iteration.id)
       #render :action => "show"
end


def show
	@project = Project.find(params[:project_id])
	@iteration = Iteration.find(params[:iteration_id])
	@story = @iteration.story.find(params[:id])
	@paginatestory = @story.tasks.paginate(:page => params[:page], :per_page => 8)
end

def edit
   @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:iteration_id])
    @story = @iteration.story.find(params[:id])
end

def update
   @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:iteration_id])
    @story = @iteration.story.find(params[:id])
	
    if @story.update_attributes(params[:story])
        redirect_to project_iteration_story_path(@project.id,@iteration.id,@story.id)
    else
		 render :action => "edit"
    end
  end
  def deletestory
 @project_id = params[:project_id]
 @iteration_id = params[:iteration_id]
 @story_id = params[:story_id]
  @story = Story.find(@story_id)
	#raise @story.inspect
	@story.destroy
		redirect_to project_iteration_path( @project_id,@iteration_id)
  end
end
