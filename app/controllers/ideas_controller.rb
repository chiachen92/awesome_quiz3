class IdeasController < ApplicationController

  before_action  :find_idea, {only: [:show, :edit, :update, :destroy]}

  def index
    @ideas = Idea.all.order(created_at: :desc)
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    if @idea.save
      redirect_to idea_path(@idea), notice: "New Idea Created"
    else
      flash[:alert] = "noooo idea"
      render :new
    end
  end

  def show


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


end
