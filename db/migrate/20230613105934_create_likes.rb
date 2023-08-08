class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      # t.integer :like_count,default: 0
      t.references :user
      t.references :post
      t.timestamps
    end
    # ,null:false, foreign_key: true
    # ,null:false, foreign_key: true
    # add_index :likes[:user_id,:post_id],unique: true
  end
end
