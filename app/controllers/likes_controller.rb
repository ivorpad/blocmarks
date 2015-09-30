class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "You liked"
      redirect_to @bookmark
    else
      flash[:error] = "Like cannot be saved"
      render [:show]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find_by(bookmark_id: @bookmark.id)

    if like.destroy
      flash[:notice] = "You unliked"
      redirect_to @bookmark
    else
      flash[:error] = "Unlike cannot be processed"
      render [:show]
    end
  end

end
