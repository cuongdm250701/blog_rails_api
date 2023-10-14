class AddPostRefToPostFavorite < ActiveRecord::Migration[6.0]
  def up
    add_reference :post_favorites, :post, null: false, foreign_key: true
  end

  def down
    remove_reference :post_favorites, :post, null: false, foreign_key: true
  end
end
