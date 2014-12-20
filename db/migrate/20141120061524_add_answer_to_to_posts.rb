class AddAnswerToToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :answer_to, :integer
  end
end
