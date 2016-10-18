class AddPostIdIndexToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :post_id, :int
    add_index :comments, :body
  end
end
