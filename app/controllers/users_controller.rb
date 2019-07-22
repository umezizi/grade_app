class UsersController < ApplicationController
  PER = 10

  def index
    @users = User.page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
  end
end
