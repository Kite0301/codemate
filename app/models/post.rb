class Post < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  validates :content, length: { maximum: 1000 }
  default_scope -> { order('created_at DESC') }
end