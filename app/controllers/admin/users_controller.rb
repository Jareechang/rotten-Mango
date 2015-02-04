class Admin::UsersController < ApplicationController 

  def index
    not_admin? 
    user = User.find(session[:user_id]) 
    if user.admin
      @users = User.all
    end
  end

  def show

  end
end