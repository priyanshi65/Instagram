class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    
    create_table :follows do |t|
      
      t.integer 'following_id',null:false
      t.integer 'follower_id', null: false
      t.timestamps null:false
    end
    add_index :follows, :following_id
    add_index :follows, :follower_id
    add_index :follows, [:following_id, :follower_id],unique:true
  end
end






















  # add_column :users, :followers_count, :integer, null: false, default: 0
  # add_column :users, :followings_count, :integer, null: false, default: 0
