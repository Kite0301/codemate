class RemoveimgPostFrompost < ActiveRecord::Migration
  def change
  	remove_column :posts, :img_post, :string
  end
end
