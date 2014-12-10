class RemoveAnswersCountAndDeletedFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :answers_count, :integer
  end
end
