class SessionsController < ApplicationController
  def create
    if auth_hash.present?
      @user = OAuthUser.where(
        provider: auth_hash[:provider],
        name:     auth_hash[:info][:nickname],
        email:    auth_hash[:info][:email]
      ).first_or_create
      session[:user_id] = @user.id
      flash[:notice] = "Successfully Logged in as #{@user.nickname}"
    else
      @user = RegularUser.find_by(email: params[:session][:email])
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

  def oauth_create
    binding.pry
    @all_info = request.env["omniauth.auth"]
    @user = User.find_or_create_by()
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
