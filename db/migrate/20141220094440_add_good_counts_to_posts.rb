class AddGoodCountsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :good_counts, :integer, default: 0
  end
end
