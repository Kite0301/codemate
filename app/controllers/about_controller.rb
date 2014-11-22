class AboutController < ApplicationController
  def index
    if signed_in?
      @post = current_user.posts.build
      @feed_posts = Post.paginate(page: params[:page])
    end
  end
end