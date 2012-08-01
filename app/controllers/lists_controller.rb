class ListsController < ApplicationController
  def new
    @list = List.new
    @project = Project.find params[:project_id]
  end

  def create
    @list = List.new(params[:list])
    @project = Project.find params[:project_id]
    @list.project_id = @project.id
    if @list.save
      redirect_to project_path(@project)
    else
      flash[:error] = "List name cannot be blank"
      render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  def update

  end

  def _form
  end

  def _lists
  end
end
