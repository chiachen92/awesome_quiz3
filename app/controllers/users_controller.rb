class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create


    user_params = params.require(:user).permit([:name, :email, :password, :password_confirmation])

    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      session[:user_name]= @user.name
      # specific user id, name or else it would move the whole @user
    redirect_to root_path

    else
      flash[:alert] =
      @user.errors.full_messages.join(", ")
      render :new
    end
  end


end
