class ApplicationController < ActionController::Base
  protect_from_forgery
  private
     def current_user_check
      if (!user_signed_in?)
        redirect_to new_user_session_path
        flash[:message] = "You must be signed in to do this action"
      end
    end
end
