class AddAnswerCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :answer_count, :integer, default: 0
  end
end
