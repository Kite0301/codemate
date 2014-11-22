class AddPostTitleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
  end
end
