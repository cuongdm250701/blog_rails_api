class AddIsReceiveNotiEmailFollow < ActiveRecord::Migration[6.0]

  def up
    add_column :follows, :is_receive_email, :boolean, default: false
  end

  def down
    add_column :follows, :is_receive_email, :boolean, default: false
  end
end
