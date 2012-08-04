class ProjectsController < ApplicationController
  before_filter :current_user_check, :except => [:index]
  respond_to :html, :js
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.owner = current_user
    respond_to do |format|
      if @project.save
        @project.users << current_user
          format.html { redirect_to(@project, :notice => 'Project created.') }  
          format.js
      else
        flash[:error] = "Project name can not be blank"
        render 'new'
      end
    end
  end

  def index
    if current_user
      @projects = current_user.projects
    else
      @projects = Project.where(:private => false)
    end
  end

  def show
    @project = Project.find(params[:id])
    unless !@project.private? or @project.users.include? current_user
      redirect_to root_path
    end
  end
  
  def edit
    @project = current_user.owned_projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Your project has been updated."
      redirect_to @project
    end
  end

  def destroy
     @project = current_user.owned_projects.find(params[:id])
     @project.destroy
     flash[:notice] = "Your project has been deleted."
     redirect_to projects_path
  end

end
