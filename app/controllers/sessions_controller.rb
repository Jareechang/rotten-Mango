class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to movies_path, notice: "Welcome Back, #{user.firstname}!"
    else
      render :new 
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil 
    redirect_to movies_path, notice: "Adios!"
  end
end
