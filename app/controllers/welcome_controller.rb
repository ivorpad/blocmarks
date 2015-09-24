class WelcomeController < ApplicationController
  def index
    @topics = Topic.all
    @bookmarks = Bookmark.all
    @user = current_user
  end
end
