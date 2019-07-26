class RelationshipsController < ApplicationController
  before_action :user_login?

  def create
    gym = Gym.find(params[:favorite_gym_id])
    current_user.like(gym)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    gym = Relationship.find(params[:id]).favorite_gym
    current_user.unlike(gym)
    redirect_back(fallback_location: root_path)
  end
end
