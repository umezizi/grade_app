class GymsController < ApplicationController
  before_action :user_login?, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user?, only: [:destroy]

  MAX_GYMS    = 9
  MAX_REVIEWS = 5

  def index
    @q    = Gym.ransack(params[:q])
    @gyms = @q.result.includes(gym_image_attachment: :blob).page(params[:page]).per(MAX_GYMS)
  end

  def show
    @gym = Gym.find(params[:id])
    @users   = @gym.guest_users.includes(image_attachment: :blob)
    @reviews = @gym.reviews.includes(user: [image_attachment: :blob])
                                           .page(params[:page]).per(MAX_REVIEWS)

    @grade       = Review.rating_average(@gym.id, :grade)
    @breadth     = Review.rating_average(@gym.id, :breadth)
    @wall_height = Review.rating_average(@gym.id, :wall_height)
    @congestion  = Review.rating_average(@gym.id, :congestion)
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)
    if @gym.save
      flash[:success] = 'ジムが追加されました！'
      redirect_to gym_path(@gym)
    else
      render 'new'
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
      render 'edit'
    end
  end

  def destroy
    Gym.find(params[:id]).destroy
    redirect_to root_path
  end

  private

    def gym_params
      params.require(:gym).permit(:gym_name, :details, :gym_image,
                                  :prefecture, :address, :latitude, :longitude)
    end
end
