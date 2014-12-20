class AddAnswerGoodsCountToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answer_goods_count, :integer, default: 0
  end
end
