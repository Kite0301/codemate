class CreateAnswerGoods < ActiveRecord::Migration
  def change
    create_table :answer_goods do |t|
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
    add_index :answer_goods, :user_id
    add_index :answer_goods, :answer_id
    add_index :answer_goods, [:user_id, :answer_id], unique: true
  end
end
