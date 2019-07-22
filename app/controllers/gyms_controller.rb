class GymsController < ApplicationController
  before_action :user_login?, only: [:new, :create, :destroy]
  before_action :admin_user,  only: [:new, :create, :destroy]

  def index
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

  private

    def gym_params
      params.require(:gym).permit(:gym_name, :details, :gym_image)
    end
end
