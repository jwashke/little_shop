class SessionsController < ApplicationController
  def create
    if auth_hash.present?
      @user = User.o_auth_find_or_create_by(auth_hash)
      session[:user_id] = @user.id
      flash[:notice] = "Successfully Logged in as #{@user.first_name}"
      redirect_based_on_role
    else
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        flash[:notice] = "Successfully Logged in as #{@user.first_name}"
        redirect_based_on_role
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def redirect_based_on_role
    if current_admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  def auth_hash
    request.env["omniauth.auth"]
  end
end
