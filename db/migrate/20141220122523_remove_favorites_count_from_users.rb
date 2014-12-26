class RemoveFavoritesCountFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :favorites_count, :integer
  end
end
