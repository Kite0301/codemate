class SearchController < ApplicationController
  def index 
    @search_words = params[:word].split(" ")

    sql = []

	@search_words.each do |word|
	    sql.push("content LIKE ('%"+ word +"%') ")
	end

	sql2 = sql.join(" OR ");

	sql2 = 'SELECT "posts".* FROM "posts" WHERE ' + sql2

	@posts = Post.find_by_sql("#{sql2}")
   
  end
end