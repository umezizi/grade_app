class PostsController < ApplicationController
  before_action :user_login?,     only: [:create, :destroy]
  before_action :delete_post_set, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      @feed_items = []
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: user_path(current_user))
  end

  private

    def post_params
      params.require(:post).permit(:comment)
    end

    def delete_post_set
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to user_path(current_user) if @post.nil?
    end
end
