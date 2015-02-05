class Admin::UsersController < ApplicationController 

  def index
    restrict_access
    user = User.find(session[:user_id]) if session[:user_id]
    if admin?
      @users = User.all.page params[:page]
    end
  end

  def show

  end
end