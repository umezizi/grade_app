class ReviewsController < ApplicationController
  before_action :user_login?,  only: [:new, :create, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @gym    = Gym.find(params[:gym_id])
    @review = @gym.reviews.new
  end

  def create
    @gym     = Gym.find(params[:gym_id])
    @review  = @gym.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = 'レビューが投稿されました！'
      redirect_to gym_path(@gym)
    else
      render 'new'
    end
  end

  def destroy
    @review.destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def review_params
      params.require(:review).permit(:title, :content, :grade, :breadth, :wall_height, :congestion)
    end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_path if @review.nil?
    end
end
