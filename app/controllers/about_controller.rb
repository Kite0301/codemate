class AboutController < ApplicationController
  def index
  	@feed_posts = Post.all.order(:created_at).reverse_order.paginate(page: params[:page] , :per_page => 10)
  	@tags = Post.tag_counts_on(:tags).order('count DESC')
  	@popular_posts = Post.all.order(:favorites_count)

    if signed_in?
      @post = current_user.posts.build
    end
  end
end