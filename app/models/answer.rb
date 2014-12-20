class Answer < ActiveRecord::Base
	belongs_to :post, counter_cache: true
	belongs_to :user
	has_many :answer_goods
  	has_many :answer_gooding_users, through: :answer_goods, source: :user
end
