class AddBestAnswerToPost < ActiveRecord::Migration
  def change
    add_column :posts, :best_answer, :integer, default: 0
  end
end
