class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.fav(current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.unfav(current_user)
    redirect_back(fallback_location: root_path)
  end
end
