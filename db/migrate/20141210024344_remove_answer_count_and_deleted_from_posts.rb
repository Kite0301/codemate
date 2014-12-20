class RemoveAnswerCountAndDeletedFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :answer_count, :integer
  end
end
