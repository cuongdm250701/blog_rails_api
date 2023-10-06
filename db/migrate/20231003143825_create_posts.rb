class CreatePosts < ActiveRecord::Migration[6.0]

  def up
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :status
      t.text :reason

      t.timestamps
    end
  end

  def down
    drop_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :status
      t.text :reason

      t.timestamps
    end
  end
end
