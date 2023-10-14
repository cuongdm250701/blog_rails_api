class CreatePostFavorites < ActiveRecord::Migration[6.0]
  def up
    create_table :post_favorites do |t|

      t.timestamps
    end
  end

  def down
    drop_table :post_favorites do |t|

      t.timestamps
    end
  end
end
