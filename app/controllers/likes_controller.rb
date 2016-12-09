class LikesController < ApplicationController
  before_action :authenticate_user!
  # the user can only do these actions if signed in

  def create
    @like = Like.new
    @idea = Idea.find params[:idea_id]

    # :idea_id because it's nested routes
    @user = current_user
    @like.idea_id = @idea.id
    # @idea which we found earlier
    @like.user = @user
    # @like.user = current_user
    # setting two columns in likes record to idea and user ids

    if can?(:like, @idea) && @like.save
      redirect_to root_path
    else
      flash[:alert] = "failed to like"
      redirect_to root_path
    end
  end

  def destroy
    @like = Like.find params[:id]
    @idea = @like.idea

    if can?(:like, @idea) && @like.destroy
    redirect_to root_path
    else
    redirect_to root_path, alert: "unauthorized access"
    end

  end
end
