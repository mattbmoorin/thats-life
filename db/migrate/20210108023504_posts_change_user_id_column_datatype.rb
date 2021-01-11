class PostsChangeUserIdColumnDatatype < ActiveRecord::Migration
  def change
    change_column :posts, :user_id, :string
  end
end
