class IdeasController < ApplicationController

  def index
    @ideas = Idea.all.order(created_at: :desc)


  end

  def new
    @idea = Idea.new
  end

  def create
  end

  def show
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private


end
