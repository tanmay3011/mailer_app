class AddIndexToReceivers < ActiveRecord::Migration
  def change
    add_index :receivers, :email_id
    add_index :receivers, :mailbox_id
  end
end
