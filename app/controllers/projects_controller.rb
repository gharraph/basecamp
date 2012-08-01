class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      Membership.create(:project_id => @project.id, :user_id => current_user.id)
      redirect_to @project
    else
      flash[:error] = "Project name can not be blank"
      render 'new'
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Your project has been updated."
      redirect_to @project
    end
  end

  def destroy
     @project = Project.find(params[:id])
     @project.destroy
     flash[:notice] = "Your project has been deleted."
     redirect_to projects_path
  end

end
