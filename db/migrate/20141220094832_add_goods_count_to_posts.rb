class AddGoodsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :goods_count, :integer, default: 0
  end
end
