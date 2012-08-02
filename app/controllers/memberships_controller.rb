class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @project = Project.find(params[:project_id])
      @membership = @project.memberships.build(:user_id => @user.id, :project_id => @project.id)
      if @membership.save
            redirect_to project_path(@membership.project_id)
            flash[:notice] = "Member saved successfully."
      else
            render 'new'
      end
    else
        flash[:error] = "User does not exist."
        redirect_to new_project_membership_path(params[:project_id])
    end
  end

  def show
  end

  def _form
  end

  def edit
  end

  def index
  end
end
