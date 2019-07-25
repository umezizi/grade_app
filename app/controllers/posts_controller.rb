class PostsController < ApplicationController
  before_action :user_login?, only: [:create, :destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:comment)
    end
end
