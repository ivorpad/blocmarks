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
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "The topic #{@topic.title} has been  created."
      redirect_to topics_path
    else
      flash[:error] = "The topic #{@topic.title} cannot be created."
      render 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(topic_params)
      flash[:notice] = "Topic updated"
      redirect_to topics_path
    else
      flash[:error] = "Topic cannot be updated"
      render :edit
    end
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


  private

  def topic_params
    params.require(:topic).permit(:title)
  end

end
