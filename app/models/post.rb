class Post < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  validates :content, length: { maximum: 1000 }
  default_scope -> { order('created_at DESC') }
  has_many :favorites
  has_many :favoriting_users, through: :favorites, source: :user

  acts_as_taggable # acts_as_taggable_on :tags のエイリアス

end