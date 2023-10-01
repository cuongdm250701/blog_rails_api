class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  
  def up
    add_column :users, :username, :string, null: false
  end

  def down
    remove_column :users, :username, :string, null: false
  end
end
