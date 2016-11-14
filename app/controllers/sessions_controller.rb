class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # byebug
    if user && user.authenticate(params[:password])
      # user.authenticate = checks the password correctness
      # def authenticate_user! in application controller checks to see whether the user is logged in or logged out
      session[:user_id] = user.id
      session[:user_name]= user.name
      redirect_to root_path, notice: "You're IN"
    else
      flash[:alert]= "Wrong credentials"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to root_path, notice: "Bye! Logged out."
  end

end
