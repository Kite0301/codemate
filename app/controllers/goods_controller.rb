class GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    current_user.good!(@post)
    @post.user.update(point: current_user.point + 1)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    @post = Good.find(params[:id]).post
    @post.user.update(point: current_user.point - 1)
    current_user.ungood!(@post)
     respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
