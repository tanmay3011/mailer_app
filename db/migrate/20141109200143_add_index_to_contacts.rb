class AddIndexToContacts < ActiveRecord::Migration
  def change
    add_index :contacts, :mailbox_id
  end
end
