class RemoveAnswersGoodsCountFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :answers_goods_count, :integer
  end
end
