class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
    add_index :goods, :user_id
    add_index :goods, :post_id
    add_index :goods, [:user_id, :post_id], unique: true
  end
end
