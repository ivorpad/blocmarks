class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    # Find the user by using params[:sender]
    @user = User.find(params[:sender])
    # Find the topic by using params[:subject]
    @topic = Topic.find(params[:subject])

    # Assign the url to a variable after retreiving it from params["body-plain"]
    @url = params["body-plain"]
    # Check if user is nil, if so, create and save a new user

    if @user.nil?
      @user = User.create(email: params[:sender])
    end

    # Check if the topic is nil, if so, create and save a new topic
    if @topic.nil?
      @topic = Topic.create(title: params[:subject], user_id: @user.id)
    end

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = Bookmark.create(url: @url, topic_id: @topic.id)
    # Assuming all went well.
    head 200
  end
end
