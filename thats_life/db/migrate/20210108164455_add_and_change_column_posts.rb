class AddAndChangeColumnPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author_name, :string
    change_column :posts, :user_id, :integer
  end
end
