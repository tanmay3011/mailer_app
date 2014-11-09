class AddMailboxReferenceToFriends < ActiveRecord::Migration
  def change
    add_reference :friends, :mailbox, index: true
  end
end
