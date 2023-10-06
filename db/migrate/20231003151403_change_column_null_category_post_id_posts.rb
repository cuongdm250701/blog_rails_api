class ChangeColumnNullCategoryPostIdPosts < ActiveRecord::Migration[6.0]

  def up
    change_column_null :posts, :category_post_id, false
  end

  def down
    change_column_null :posts, :category_post_id, true
  end
end
