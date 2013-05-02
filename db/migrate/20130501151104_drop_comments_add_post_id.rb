class DropCommentsAddPostId < ActiveRecord::Migration
  def up
    add_column :posts, :post_id, :integer
  end

  def down
    drop_table :comments
  end
end
