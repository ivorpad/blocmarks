class TopicsController < ApplicationController

  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
    @topics = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))

    if @topic.save
      flash[:notice] = "The topic has been #{@topic.id} created."
      redirect_to topics_path
    else
      flash[:error] = "The topic #{@topic.id} cannot be created."
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "The topic has been deleted."
      redirect_to @topic
    else
      flash[:error] = "The topic cannot be deleted."
      redirect_to @topic
    end
  end
end
