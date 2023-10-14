class CreateFollows < ActiveRecord::Migration[6.0]
  
  def up
    create_table :follows do |t|

      t.timestamps
    end
  end

  def down
    drop_table :follows do |t|
       
      t.timestamps
    end
  end
end
