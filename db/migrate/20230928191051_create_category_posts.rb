class CreateCategoryPosts < ActiveRecord::Migration[6.0]

  def up
    create_table :category_posts do |t|
      t.string :title, null: false

      t.timestamps
    end
  end

  def down
    drop_table :category_posts do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
