class AnswerGood < ActiveRecord::Base
	belongs_to :user
  	belongs_to :answer, counter_cache: true
end
