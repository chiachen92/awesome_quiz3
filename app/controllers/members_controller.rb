class MembersController < ApplicationController
  before_action :authenticate_user!
  def create
    @member = Member.new
    @idea = Idea.find params[:idea_id]

    # :idea_id because it's nested routes
    @user = current_user
    @member.idea_id = @idea.id
    # @idea is defined in the earlier line
    # @idea which we found earlier
    @member.user = @user
    # @member.user = current_user
    # setting two columns in members record to idea and user ids

    if can?(:join, @idea) && @member.save
      redirect_to root_path
    else
      flash[:alert] = "failed to join"
      redirect_to root_path
    end
  end

  def destroy
    @member = Member.find params[:id]
    @idea = @member.idea
    if can?(:join, @idea) && @member.destroy
      redirect_to root_path
    else
      redirect_to root_path, alert: "unauthorized access"
    end

  end

end
