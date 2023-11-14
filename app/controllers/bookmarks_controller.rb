class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    # raise
    @bookmark = Bookmark.new(bookmark_params)
    list = List.find(params[:list_id])
    @bookmark.list = list
    if @bookmark.save
      redirect_to list_path(list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # raise
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # next line is poss because the bookmark object is still in memory until the end of the controller action.
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
    # nb params look like this:
    # {"authenticity_token"=>"[FILTERED]", "bookmark"=>{"movie_id"=>"13", "comment"=>"I think this is meant to be scary"}, "commit"=>"Create Bookmark", "list_id"=>"7"}
  end

end
