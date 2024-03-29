class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @review = Review.new
    @reviews = @list.reviews
    @bookmarks = @list.bookmarks
    @bookmark_new = Bookmark.new
  end

  # def new
  #   @list = List.new
  # end

  def create
    raise
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
