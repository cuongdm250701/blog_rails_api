class AddRoleToUser < ActiveRecord::Migration[6.0]
  
  def up
    add_column :users, :role, :integer, default: 1
  end

  def down
    remove_column :users, :role, :integer, default: 1
  end

end
