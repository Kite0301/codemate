class AddAnswersCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :answers_count, :integer, default: 0
  end
end
