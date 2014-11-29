class AboutController < ApplicationController
  def index
  	@feed_posts = Post.paginate(page: params[:page])
  	@tags = Post.tag_counts_on(:tags).order('count DESC')
  	
    if signed_in?
      @post = current_user.posts.build
    end
  end
end