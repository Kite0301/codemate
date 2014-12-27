class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]
	has_many :posts, dependent: :destroy
	has_many :answers
	
	# validates :password,
	# :length => { :minimum => 6, :if => :validate_password? },
	# :confirmation => { :if => :validate_password? },
	# :presence => true

	has_many :favorites
	has_many :favorite_posts, through: :favorites, source: :post
	has_many :goods
  	has_many :good_posts, through: :goods, source: :post
  	has_many :answer_goods
  	has_many :answer_good_answers, through: :answer_goods, source: :answer
	
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

	def good?(post)
	    goods.find_by(post_id: post.id)
	end

	def good!(post)
	    goods.create!(post_id: post.id)
	end

	def ungood!(post)
	    goods.find_by(post_id: post.id).destroy
	end

	def answer_good?(answer)
    	answer_goods.find_by(answer_id: answer.id)
  	end

  	def answer_good!(answer)
    	answer_goods.create!(answer_id: answer.id)
  	end

  	def unanswer_good!(answer)
    	answer_goods.find_by(answer_id: answer.id).destroy
  	end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20],
                         image:    "#{auth.info.image}?width=150&height=150"
                        )
    end
    user
  end
 
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.info.nickname,
                         provider: auth.provider,
                         uid:      auth.uid,
                         password: Devise.friendly_token[0,20],
                         image:    "#{auth.info.image}?width=150&height=150"
                        )
    end
    user
  end

  def self.create_unique_string
    SecureRandom.uuid
  end
 
  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end

	private

	def validate_password?
		password.present? || password_confirmation.present?
	end

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end

