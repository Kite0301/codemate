class AddFavoritesCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :favorites_count, :integer, default: 0
  end
end
