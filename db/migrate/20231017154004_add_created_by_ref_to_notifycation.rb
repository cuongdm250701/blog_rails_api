class AddCreatedByRefToNotifycation < ActiveRecord::Migration[6.0]

  def up
    add_reference :notifycations, :created_by, foreign_key: { to_table: :users }
  end

  def down
    remove_reference :notifycations, :created_by, foreign_key: { to_table: :users }
  end
end
