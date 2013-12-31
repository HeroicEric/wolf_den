class AddUserIdToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :user_id, :integer

    anon_user = User.find_or_initialize_by(email: "anonymous@anonymous.com")
    anon_user.password = "applepie"
    anon_user.password_confirmation = "applepie"
    anon_user.save! 

    Post.find_each do |post|
      post.user = anon_user
      post.user_id = anon_user.id
      post.save!
    end

    change_column :posts, :user_id, :integer, null: false
  end

  def down
    remove_column :posts, :user_id
  end
end
