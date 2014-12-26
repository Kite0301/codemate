class AddAnswersGoodsCountToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answers_goods_count, :integer, default: 0
  end
end
