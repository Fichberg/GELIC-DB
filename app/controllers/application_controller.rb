class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login


  def current_user
    @current_user ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_user

  private

  def require_login
    unless current_user
      redirect_to '/log-in'
    end
  end

end
