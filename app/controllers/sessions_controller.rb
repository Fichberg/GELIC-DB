class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def create
    @membro = Membro.authenticate(params[:email], params[:senha])
    if @membro
      flash[:notice] = "You've been logged in."
      session[:membro_email] = @membro.email
      redirect_to "/"
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to '/log-in'
    end
  end

  def destroy
    session[:membro_email] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end

end
