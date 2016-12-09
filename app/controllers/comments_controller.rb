class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @idea = Idea.find params[:idea_id]
    @comment = Comment.new comment_params
    @comment.idea = @idea
    # the comment of this idea(which is a field/column in the table (idea_id)) is set to @idea which is defined earlier: @idea = Idea.find params[:idea_id]
    @comment.user = current_user
    # another field in the table (user_id)
    if @comment.save
      redirect_to idea_path(@idea), notice: "Comment created"
    else
      flash[:alert] = "Failed comment"
      render "/ideas/show"
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    idea = @comment.idea
    # don't fully get the line above so the it's the same as @comment.idea = @idea just decided to use a local variable
    @comment.destroy
    redirect_to idea_path(idea), notice: "deleted comment"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
