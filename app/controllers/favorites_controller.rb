class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    current_user.favorite!(@post)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    
  end

  def destroy
    @post = Favorite.find(params[:id]).post
    current_user.unfavorite!(@post)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    
  end
end