class AddColumnUserIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_id, :int
  end
end
