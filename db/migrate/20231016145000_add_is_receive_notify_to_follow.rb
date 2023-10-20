class AddIsReceiveNotifyToFollow < ActiveRecord::Migration[6.0]

  def up
    add_column :follows, :is_receive_notifycation, :boolean, default: false
  end

  def down
    remove_column :follows, :is_receive_notifycation, :boolean, default: false
  end
end
