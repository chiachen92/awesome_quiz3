class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  before_action  :find_idea, {only: [:show, :edit, :update, :destroy]}

  before_action :authenticate_access, only: [:edit, :update, :destroy]


  def index
    @ideas = Idea.all.order(created_at: :desc)
  end

  def new
    @idea = Idea.new
  end

  def create
    # just before we save we want to add the current user id to the idea

    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to idea_path(@idea), notice: "New Idea Created"
    else
      flash[:alert] = "noooo idea"
      render :new
    end
  end

  def show
    # the comment is suppose to be displayed on an idea, therefore this is where the form is getting called
    # ArgumentError in Ideas#show
    # Showing /Users/Jyang/Desktop/projects/awesome_quiz3/app/views/comments/_commentform.html.erb where line #2 raised:
    #
    # First argument in form cannot contain nil or be empty
    # Extracted source (around line #2):

    # <h2>Make a comment</h2>
    # <%= form_for [@idea, @comment] do |r|%>
    # <%#=@idea, @comment is from nested routes and @idea @comment is defined in the show page   def find_idea
    #     @idea = Idea.find params[:id]
    #   end is defined in the idea controller show action %>
    #  <div>
    @idea = Idea.find params[:id]
    # find idea
    @comment = Comment.new
    # make a new comment


  end

  def edit



  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      flash[:alert] = "fix errors"
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to root_path

  end

  private

  def idea_params
    params.require(:idea).permit([:title, :body])
  end

  def find_idea
    @idea = Idea.find params[:id]
  end

  def authenticate_access
    if cannot?(:edit_delete, @idea)
      # if current_user can edit delete this idea
      redirect_to root_path, alert: "unauthorized access"
    end

  end


end
