class ChangeColumnNullFollow < ActiveRecord::Migration[6.0]

  def up
    change_column_null :follows, :followed_user_id, false
    change_column_null :follows, :follower_by_user_id, false
  end

  def down
    change_column_null :follows, :followed_user_id, true
    change_column_null :follows, :follower_by_user_id, true
  end
end

