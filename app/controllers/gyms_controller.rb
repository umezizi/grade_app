class GymsController < ApplicationController
  before_action :user_login?, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user,  only: [:new, :create, :edit, :update, :destroy]

  def index
    @gyms = Gym.page(params[:page]).per(9)
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)
    if @gym.save
      redirect_to gym_path(@gym)
    else
      render "new"
    end
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    if @gym.update_attributes(gym_params)
      redirect_to gym_path(@gym)
    else
      render "edit"
    end
  end

  def destroy
    Gym.find(params[:id]).destroy
    redirect_to root_path
  end

  private

    def gym_params
      params.require(:gym).permit(:gym_name, :details, :gym_image)
    end
end
