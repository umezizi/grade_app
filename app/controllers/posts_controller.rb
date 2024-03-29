class PostsController < ApplicationController
  before_action :user_login?,  only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to user_path(current_user)
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: user_path(current_user))
  end

  private

    def post_params
      params.require(:post).permit(:comment)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to user_path(current_user) if @post.nil?
    end
end
