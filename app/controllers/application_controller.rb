class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
    def require_login
        unless current_user
            flash[:error] = "You must be logged in to access this section"
            redirect_to new_user_path # redirect to the login page
          end
    end      
end
