class Admin::UsersController < ApplicationController 

  def index
    restrict_access
    user = User.find(session[:user_id]) if session[:user_id]
    if admin?
      @users = User.all.page params[:page]
    end
  end

  def destroy 
    @user = User.find(params[:id])
    UserMailer.mail_user(@user)
    @user.destroy
    redirect_to admin_users_path
  end
end