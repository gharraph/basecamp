class ListsController < ApplicationController
  respond_to :html, :js
  
  def new
    @list = List.new
    @project = Project.find params[:project_id]
  end

  def create
    @project = current_user.projects.find params[:project_id]
    @list = @project.lists.build(params[:list])
    respond_to do |format|
      if @list.save
        format.js
      else
        flash[:error] = "List name cannot be blank"
        render 'new'
      end
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = current_user.owned_projects.find(params[:id])
  end

  def update

    @list = current_user.projects.find(params[:id])
    # if current_user.id == @list.project.owner_id
    @list.update_attributes(params[:list])
      flash[:notice] = "Your list has been updated."
      redirect_to @list
  end
  
  def destroy
     @list = List.find(params[:id])
     @project = @list.project
     @list.destroy
     flash[:notice] = "Your list has been deleted."
     redirect_to project_path(@project)
  end
  
end
