class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: true, foreign_key: true   
      #reject enteries whose foreign key values are not in reference user
      t.string :user_name
      t.string :bio
      t.timestamps
    end
  end
end
