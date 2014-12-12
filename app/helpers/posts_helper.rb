module PostsHelper
	include ActsAsTaggableOn::TagsHelper

	def question_image_post_for(post, size = '52')
    image_tag "/docs/#{post.image_post}", size: size, class: :gravatar
  end
end