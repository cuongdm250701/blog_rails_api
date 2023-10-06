class AddDefaultColumnStatusPosts < ActiveRecord::Migration[6.0]

  def up
    change_column :posts, :status, :integer, default: 1
  end

  def down
    change_column :posts, :status, :integer, default: null
  end
end
