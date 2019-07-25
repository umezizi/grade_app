class RelationshipsController < ApplicationController
  before_action :user_login?

  def create
    @gym = Gym.find(params[:favorite_gym_id])
    current_user.like(@gym)
    respond_to do |format|
      format.html { redirect_to @gym }
      format.js
    end
  end

  def destroy
    @gym = Relationship.find(params[:id]).favorite_gym
    current_user.unlike(@gym)
    respond_to do |format|
      format.html { redirect_to @gym }
      format.js
    end
  end
end
