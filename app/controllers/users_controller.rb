class UsersController < ApplicationController
  before_action :user_login?, only: [:index, :show, :destroy]
  before_action :admin_user, only: :destroy

  PER = 10

  def index
    @users = User.page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

end
