class AddImagePostToPost < ActiveRecord::Migration
  def change
    add_column :posts, :image_post, :string
  end
end
