class RemoveanswersCountFromuser < ActiveRecord::Migration
  def change
  	remove_column :users, :answer_count, :integer
  end
end
