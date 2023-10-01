class AddIsLoginToUsers < ActiveRecord::Migration[6.0]

  def up
    add_column :users, :is_login, :boolean, default: false
  end

  def down
    remove_column :users, :is_login, :boolean, default: false
  end
end
