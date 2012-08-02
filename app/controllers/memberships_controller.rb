class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      project = Project.find(params[:project_id])
      project.users << user
      redirect_to project, :notice => "Member saved successfully."
    else
      flash[:error] = "User does not exist."
      render 'new'
    end
  end

end
