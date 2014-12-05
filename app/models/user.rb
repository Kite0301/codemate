class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :answers
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	has_secure_password
	
	validates :password,
	:length => { :minimum => 8, :if => :validate_password? },
	:confirmation => { :if => :validate_password? },
	:presence => true

	has_many :favorites
	has_many :favorite_posts, through: :favorites, source: :post
	
	def set_image(file)
		if !file.nil?
			file_name = file.original_filename
			File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
			self.image = file_name
		else
			file_name = "noimage.jpg"
			self.image = file_name
		end
	end
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def favorite?(post)
		favorites.find_by(post_id: post.id)
	end

	def favorite!(post)
		favorites.create!(post_id: post.id)
	end

	def unfavorite!(post)
		favorites.find_by(post_id: post.id).destroy
	end

	private

	def validate_password?
		password.present? || password_confirmation.present?
	end

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end

