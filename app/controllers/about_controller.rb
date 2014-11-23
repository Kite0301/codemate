class AboutController < ApplicationController
  def index
  	@feed_posts = Post.paginate(page: params[:page])
  	
    if signed_in?
      @post = current_user.posts.build
    end
  end
end