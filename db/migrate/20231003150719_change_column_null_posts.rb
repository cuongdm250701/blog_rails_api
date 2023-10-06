class ChangeColumnNullPosts < ActiveRecord::Migration[6.0]

  def up
    change_column_null :posts, :user_id, false
    change_column_null :posts, :status, false
  end

  def down
    change_column_null :posts, :user_id, true
    change_column_null :posts, :status, true
  end
end
