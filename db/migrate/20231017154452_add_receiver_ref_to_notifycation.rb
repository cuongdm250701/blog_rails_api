class AddReceiverRefToNotifycation < ActiveRecord::Migration[6.0]

  def up
    add_reference :notifycations, :receiver, foreign_key: { to_table: :users }
  end

  def down
    remove_reference :notifycations, :receiver, foreign_key: { to_table: :users }
  end
end
