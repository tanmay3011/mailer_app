class AddIndexToLogs < ActiveRecord::Migration
  def change
    add_index :logs, :mailbox_id
  end
end
