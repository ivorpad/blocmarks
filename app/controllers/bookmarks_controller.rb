class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    @topics = Topic.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save

      flash[:notice] = "The bookmark #{@bookmark.url} has been created."
      redirect_to topics_path
    else
      flash[:error] = "The bookmark could not be created."
      render 'new'
    end
  end

  def edit
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
