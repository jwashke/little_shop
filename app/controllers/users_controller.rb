class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account successfully created"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :address,
      :city,
      :state,
      :zip
    )
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
