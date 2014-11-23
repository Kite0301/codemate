class SearchController < ApplicationController
  def index 
    @search_word = params[:word]
    @users = User.where(['name LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
    @posts = Post.where(['content LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
  end
end