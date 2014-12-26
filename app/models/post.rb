class Post < ActiveRecord::Base
  has_many :answers
  belongs_to :user, counter_cache: true
  validates :content, presence: true, length: { maximum: 1000 }
  # default_scope -> { order('created_at DESC') }
  has_many :favorites
  has_many :favoriting_users, through: :favorites, source: :user
  validates :title, presence: true, length: { maximum: 50 }
  belongs_to :bestanswer_id
  has_many :goods
  has_many :gooding_users, through: :goods, source: :user

  acts_as_taggable # acts_as_taggable_on :tags のエイリアス
  def set_image(file)
		if !file.nil?
			file_name = file.original_filename
			File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
			self.image_post = file_name
		end
	end
  
end