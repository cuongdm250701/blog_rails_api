class ChangeColunmNullNotifycation < ActiveRecord::Migration[6.0]

  def up
    change_column_null :notifycations, :created_by_id, false
    change_column_null :notifycations, :receiver_id, false
  end

  def down
    change_column_null :notifycations, :created_by_id, true
    change_column_null :notifycations, :receiver_id, true
  end
end
