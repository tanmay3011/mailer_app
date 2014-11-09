class AddIndexToAttachments < ActiveRecord::Migration
  def change
    add_index :attachments, :email_id
  end
end
