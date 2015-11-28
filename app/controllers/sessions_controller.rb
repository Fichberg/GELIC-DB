class SessionsController < ApplicationController
  skip_before_filter :require_login

  def create
    @member = Member.authenticate(params[:email], params[:senha])
    if @member
      flash[:notice] = "You've been logged in."
      session[:member_id] = @member.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to '/log-in'
    end
  end

  def destroy
    session[:member_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end

end
