class UsersController < ApplicationController
  before_action :user_login?, only: [:index, :show, :destroy]
  before_action :admin_user?, only: :destroy

  MAX_USERS   = 10
  MAX_REVIEWS = 5
  MAX_POSTS   = 5
  MAX_ITEMS   = 5

  def index
    @users = User.includes(image_attachment: :blob).page(params[:page]).per(MAX_USERS)
  end

  def show
    @user = User.find(params[:id])
    @post = current_user.posts.build
    @feed_items = current_user.feed.includes(:user).page(params[:page]).per(MAX_ITEMS)

    @gyms    = @user.favorite_gyms.includes(gym_image_attachment: :blob)
    @reviews = @user.reviews.page(params[:page]).per(MAX_REVIEWS)
    @posts   = @user.posts.page(params[:page]).per(MAX_POSTS)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

end
