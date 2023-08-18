class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params["list_id"])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    list = List.find(params["list_id"])
    movie = params[:bookmark][:movie_id]

    @bookmark.movie_id = movie.to_i
    @bookmark.list_id = list.id

    @bookmark.save
    redirect_to list_path(list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
