class ReviewsController < ApplicationController
  before_action :user_login?, only: [:new, :create, :destroy]

  def new
    @gym    = Gym.find(params[:gym_id])
    @review = @gym.reviews.new
  end

  def create
    @gym     = Gym.find(params[:gym_id])
    @review  = @gym.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to gym_path(@gym)
    else
      render "new"
    end
  end

  def destroy
    @gym = Gym.find(params[:gym_id])
    Review.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def review_params
      params.require(:review).permit(:title, :content, :grade, :breadth, :wall_height, :congestion)
    end
end
