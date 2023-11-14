class ReviewsController < ApplicationController
  before_action :find_list, only: [:create]  # Add a before_action to find the list

  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.list = List.find(params[:list_id])
    # raise
    if @review.save
      redirect_to list_path(@review.list)
    else
      puts @review.errors.full_messages  # Check for validation errors in the console
      render :new, status: :unprocessable_entity
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end


  def find_list
    @list = List.find(params[:list_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'List not found'  # Redirect if list is not found
  end
end
