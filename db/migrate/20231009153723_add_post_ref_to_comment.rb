class AddPostRefToComment < ActiveRecord::Migration[6.0]
  def up
    add_reference :comments, :post, null: false, foreign_key: true
  end

  def down
    remove_reference :comments, :post, null: false, foreign_key: true
  end
end
