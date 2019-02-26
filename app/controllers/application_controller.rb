class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(username: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged to perform this action"
      redirect_to root_path
    end
  end
end
