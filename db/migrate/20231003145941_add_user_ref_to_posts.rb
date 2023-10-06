class AddUserRefToPosts < ActiveRecord::Migration[6.0]

  def up
    add_reference :posts, :user, foreign_key: true
  end

  def down
    remove_reference :posts, :user, foreign_key: true
  end
end
