class UsersController < ApplicationController
  before_action :user_login?, only: [:index, :show, :destroy]
  before_action :admin_user?, only: :destroy

  MAX_USERS   = 10
  MAX_REVIEWS = 8
  MAX_POSTS   = 10
  MAX_ITEMS   = 10
  MAX_GYMS    = 15

  def index
    @users = User.includes(image_attachment: :blob).page(params[:page]).per(MAX_USERS)
  end

  def show
    @user = User.includes(image_attachment: :blob).find(params[:id])
    @post = current_user.posts.build

    @feed_items = @user.feed.includes(user: [image_attachment: :blob])
                                      .page(params[:feed_page]).per(MAX_ITEMS)
    @posts   = @user.posts.page(params[:post_page]).per(MAX_POSTS)
    @reviews = @user.reviews.includes(gym: [gym_image_attachment: :blob])
                                      .page(params[:review_page]).per(MAX_REVIEWS)
    @gyms_all = @user.favorite_gyms.includes(gym_image_attachment: :blob)
    @gyms     = @gyms_all.page(params[:gym_page]).per(MAX_GYMS)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end
end
