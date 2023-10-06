class AddCategoryRefToPosts < ActiveRecord::Migration[6.0]

  def up
    add_reference :posts, :category_post, foreign_key: true
  end

  def down
    remove_reference :posts, :category_post, foreign_key: true
  end
end
