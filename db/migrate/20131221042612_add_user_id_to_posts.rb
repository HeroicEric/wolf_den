class AddUserIdToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :user_id, :integer, null: false
  end

  def down
    remove_column :posts, :user_id
  end
end
