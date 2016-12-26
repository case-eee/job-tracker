class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  skip_before_action :require_login, only: [:new, :create]

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section!"
      render file: "/public/404"
    end
  end

  def require_logged_in
    render file: "/public/404" unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
