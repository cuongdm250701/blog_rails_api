class AddIsReadNotifycation < ActiveRecord::Migration[6.0]

  def up
    add_column :notifycations, :is_read, :boolean, default: false
  end

  def down
    add_column :notifycations, :is_read, :boolean, default: false
  end
end
