class AddBestanswerIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :bestanswer_id, :integer
  end
end
