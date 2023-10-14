class AddFollowedRefToFollows < ActiveRecord::Migration[6.0]
  
  def up
    add_reference :follows, :followed_user, foreign_key: { to_table: :users }
  end

  def down
    remove_reference :follows, :followed_user, foreign_key: { to_table: :users }
  end
end
