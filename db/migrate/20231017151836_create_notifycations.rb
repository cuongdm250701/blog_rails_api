class CreateNotifycations < ActiveRecord::Migration[6.0]

  def up
    create_table :notifycations do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end

  def down
    drop_table :notifycations do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
