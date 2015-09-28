class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark

    @topics = Topic.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    authorize @bookmark
    if @bookmark.save
      flash[:notice] = "The bookmark #{@bookmark.url} has been created."
      redirect_to topics_path
    else
      flash[:error] = "The bookmark could not be created."
      # TODO: render 'new' returns Undefined Method
      redirect_to topics_path
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark #{@bookmark.url} deleted."
      redirect_to topics_path
    else
      flash[:error] = "The bookmark could not be deleted"
      render @bookmark
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    @topics = Topic.all
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark #{@bookmark.url} updated."
      redirect_to @bookmark
    else
       flash[:error] = "The bookmark could not be updated"
       render :edit
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
  end

end
