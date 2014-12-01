class TagsController < ApplicationController
	before_action :set_tag, only: [:show]
  
  def show
  	@posts = Post.tagged_with(@tag.name)
  end
  private
  def set_tag
      @tag = ActsAsTaggableOn::Tag.find(params[:id])
    end
end
