class AddFollowerRefToFollows < ActiveRecord::Migration[6.0]

  def up
    add_reference :follows, :follower_by_user, foreign_key: { to_table: :users }
  end

  def down
    remove_reference :follows, :follower_by_user, foreign_key: { to_table: :users }
  end
end
